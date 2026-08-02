/**
 * Azure AVM Schema & Template Generator
 * 
 * Fetches real input definitions from Terraform Registry V1 API
 * Generates:
 *   - JSON schemas for backend/schemas/avm/ (drives UI forms)
 *   - HCL templates for backend/templates/avm/ (Handlebars compilation)
 * 
 * Usage: node scripts/generate-avm-schemas-and-templates.js
 * 
 * Security: Only reads from public Terraform Registry API
 * No local HCL parsing to avoid injection risks from untrusted content
 */

const fs = require('fs');
const path = require('path');
const https = require('https');

// ─── Configuration ───────────────────────────────────────────────────────────
const REGISTRY_V1_API = 'https://registry.terraform.io/v1/modules';
const OVERRIDES_FILE = path.join(__dirname, '..', 'db', 'terraform_module_overrides.json');
const SCHEMAS_DIR = path.join(__dirname, '..', 'backend', 'schemas', 'avm');
const TEMPLATES_DIR = path.join(__dirname, '..', 'backend', 'templates', 'avm');
const CACHE_FILE = path.join(__dirname, '..', 'db', '.avm-registry-cache.json');
const RATE_LIMIT_MS = 400; // Be respectful to Terraform Registry

// Variables to skip (internal/meta, not user-configurable)
const SKIP_VARS = new Set([
  'telemetry_enabled',
  'resource_base_tags',
  'customer_managed_key',
]);

// ─── Type Conversion: Terraform → JSON Schema ────────────────────────────────
function tfTypeToJsonSchema(tfType) {
  if (!tfType) return 'string';
  const t = tfType.trim();

  // Primitive types
  if (t === 'string') return 'string';
  if (t === 'bool') return 'boolean';
  if (t === 'number') return 'number';

  // set(type) → array (sets become arrays in JSON)
  const setMatch = t.match(/^set\((.+)\)$/);
  if (setMatch) {
    return { type: 'array', items: tfTypeToJsonSchema(setMatch[1]) };
  }

  // list(type) → array
  const listMatch = t.match(/^list\((.+)\)$/);
  if (listMatch) {
    return { type: 'array', items: tfTypeToJsonSchema(listMatch[1]) };
  }

  // map(type) → object
  if (t.startsWith('map(')) return 'object';

  // object({...}) → object
  if (t.startsWith('object(')) return 'object';

  // optional(type, default) → unwrap
  const optMatch = t.match(/^optional\((.+),\s*.+\)$/);
  if (optMatch) return tfTypeToJsonSchema(optMatch[1]);

  // Fallback to string for unrecognized complex types
  return 'string';
}

// ─── Schema Generation ────────────────────────────────────────────────────────
function inputToSchemaProperty(input) {
  const jsonType = tfTypeToJsonSchema(input.type);

  const prop = {
    type: typeof jsonType === 'string' ? jsonType : jsonType.type,
    title: input.name
      .replace(/_/g, ' ')
      .replace(/\b\w/g, l => l.toUpperCase()),
    description: (input.description || '').replace(/\n/g, ' ').trim(),
  };

  // Preserve original Terraform type for complex types (UI can display guidance)
  if (
    input.type &&
    !['string', 'bool', 'number'].includes(input.type)
  ) {
    prop.tfType = input.type;
  }

  // Handle array items
  if (typeof jsonType === 'object' && jsonType.items) {
    prop.items = jsonType.items;
  }

  // Parse default value
  if (
    input.default !== null &&
    input.default !== undefined &&
    input.default !== '' &&
    input.default !== 'null'
  ) {
    try {
      prop.default = JSON.parse(input.default);
    } catch {
      prop.default = input.default;
    }
  }

  return prop;
}

function generateSchema(inputs) {
  const properties = {};
  const required = [];

  for (const input of inputs) {
    // Skip internal variables
    if (SKIP_VARS.has(input.name)) continue;
    if (input.name.startsWith('_')) continue;

    properties[input.name] = inputToSchemaProperty(input);
    if (input.required) {
      required.push(input.name);
    }
  }

  const schema = {
    type: 'object',
    properties,
  };

  if (required.length > 0) {
    schema.required = required;
  }

  return schema;
}

// ─── HCL Template Generation ─────────────────────────────────────────────────
function generateHclTemplate(moduleName, source, inputs, version) {
  const lines = [
    'terraform {',
    '  required_providers {',
    '    azurerm = {',
    '      source  = "hashicorp/azurerm"',
    '      version = ">= 3.0.0"',
    '    }',
    '  }',
    '}',
    '',
    `module "${moduleName}" {`,
    `  source  = "${source}"`,
    `  version = "${version || 'x.x.x'}"`,
    '',
  ];

  // Sort: required first, then alphabetical
  const sorted = [...inputs]
    .filter(i => !SKIP_VARS.has(i.name) && !i.name.startsWith('_'))
    .sort((a, b) => {
      if (a.required !== b.required) return a.required ? -1 : 1;
      return a.name.localeCompare(b.name);
    });

  // Calculate max name length for alignment
  const maxLen = Math.max(...sorted.map(i => i.name.length), 0);
  const pad = (name) => name.padEnd(maxLen);

  for (const input of sorted) {
    const paddedName = pad(input.name);
    // Triple braces {{{ }}} prevent Handlebars HTML escaping
    // {{#if}} wrapper ensures we only output lines for provided values
    lines.push(
      `  {{#${input.name}}}${paddedName} = {{{${input.name}}}}{{/${input.name}}}`
    );
  }

  lines.push('}');
  lines.push('');

  return lines.join('\n');
}

// ─── HTTP Helper ──────────────────────────────────────────────────────────────
function fetchJSON(url) {
  return new Promise((resolve, reject) => {
    const req = https.get(
      url,
      {
        headers: { 'Accept': 'application/json', 'User-Agent': 'IaC-Generator-AVM-Sync/1.0' },
        timeout: 20000,
      },
      (res) => {
        let data = '';
        res.on('data', (chunk) => (data += chunk));
        res.on('end', () => {
          if (res.statusCode === 200) {
            try {
              resolve(JSON.parse(data));
            } catch (e) {
              reject(new Error(`JSON parse error: ${e.message}`));
            }
          } else if (res.statusCode === 429) {
            reject(new Error('RATE_LIMITED'));
          } else {
            reject(new Error(`HTTP ${res.statusCode}: ${data.substring(0, 200)}`));
          }
        });
      }
    );
    req.on('error', reject);
    req.on('timeout', () => {
      req.destroy();
      reject(new Error('TIMEOUT'));
    });
  });
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

// ─── Main ────────────────────────────────────────────────────────────────────
async function main() {
  console.log('╔══════════════════════════════════════════════════════════════╗');
  console.log('║     Azure AVM Schema & Template Generator                    ║');
  console.log('║     Source: Terraform Registry V1 API                        ║');
  console.log('╚══════════════════════════════════════════════════════════════╝\n');

  // Ensure output directories exist
  fs.mkdirSync(SCHEMAS_DIR, { recursive: true });
  fs.mkdirSync(TEMPLATES_DIR, { recursive: true });

  // Load overrides
  const overrides = JSON.parse(fs.readFileSync(OVERRIDES_FILE, 'utf8'));
  const azureModules = Object.entries(overrides).filter(
    (_, v) => v.type === 'module' && v.source?.includes('/avm-')
  );

  // Fix: Object.entries returns [key, value] arrays
  const azureModuleList = Object.entries(overrides)
    .filter(([, v]) => v.type === 'module' && v.source?.includes('/avm-'))
    .map(([typeName, override]) => ({ typeName, override }));

  console.log(`Found ${azureModuleList.length} Azure AVM modules to process\n`);

  // Load cache
  let cache = {};
  if (fs.existsSync(CACHE_FILE)) {
    cache = JSON.parse(fs.readFileSync(CACHE_FILE, 'utf8'));
    console.log(`Loaded cache with ${Object.keys(cache).length} entries\n`);
  }

  let success = 0;
  let cached = 0;
  let failed = 0;
  const errors = [];

  for (const { typeName, override } of azureModuleList) {
    // Parse source: "Azure/avm-res-network-virtualnetwork/azurerm"
    const parts = override.source.split('/');
    if (parts.length !== 3) {
      errors.push(`SKIP ${typeName}: unexpected source format "${override.source}"`);
      failed++;
      continue;
    }

    const [namespace, name, provider] = parts;
    const cacheKey = `${namespace}/${name}/${provider}`;
    const schemaFile = override.schemaFile || override.hclTemplate?.replace('.hcl', '.schema.json');
    const templateFile = override.hclTemplate;

    if (!schemaFile || !templateFile) {
      errors.push(`SKIP ${typeName}: missing schemaFile or hclTemplate`);
      failed++;
      continue;
    }

    // Fetch from API or use cache
    let inputs;
    const wasCached = !!cache[cacheKey];

    if (cache[cacheKey]) {
      inputs = cache[cacheKey];
      cached++;
    } else {
      const url = `${REGISTRY_V1_API}/${namespace}/${name}/${provider}`;
      process.stdout.write(`  [${String(success + failed + 1).padStart(3)}/${azureModuleList.length}] ${name}... `);

      try {
        const response = await fetchJSON(url);
        inputs = response.root?.inputs || [];
        cache[cacheKey] = inputs;
        process.stdout.write(`${inputs.length} inputs\n`);
      } catch (err) {
        if (err.message === 'RATE_LIMITED') {
          process.stdout.write('rate limited, backing off...\n');
          await sleep(5000);
          try {
            const response = await fetchJSON(url);
            inputs = response.root?.inputs || [];
            cache[cacheKey] = inputs;
            process.stdout.write(`         retry OK: ${inputs.length} inputs\n`);
          } catch (retryErr) {
            process.stdout.write(`FAILED: ${retryErr.message}\n`);
            errors.push(`FAIL ${typeName}: ${retryErr.message}`);
            failed++;
            await sleep(RATE_LIMIT_MS);
            continue;
          }
        } else {
          process.stdout.write(`FAILED: ${err.message}\n`);
          errors.push(`FAIL ${typeName}: ${err.message}`);
          failed++;
          await sleep(RATE_LIMIT_MS);
          continue;
        }
      }
      await sleep(RATE_LIMIT_MS);
    }

    if (!inputs || inputs.length === 0) {
      errors.push(`WARN ${typeName}: 0 inputs returned`);
    }

    // Generate schema
    const schema = generateSchema(inputs);
    const schemaPath = path.join(SCHEMAS_DIR, schemaFile);
    fs.writeFileSync(schemaPath, JSON.stringify(schema, null, 2));

    // Generate HCL template
    const hcl = generateHclTemplate(name, override.source, inputs, override.version);
    const templatePath = path.join(TEMPLATES_DIR, templateFile);
    fs.writeFileSync(templatePath, hcl);

    success++;

    if (!wasCached) {
      const propCount = Object.keys(schema.properties).length;
      const reqCount = schema.required?.length || 0;
      process.stdout.write(`         ✓ ${propCount} properties, ${reqCount} required\n`);
    }
  }

  // Save cache for future runs
  fs.writeFileSync(CACHE_FILE, JSON.stringify(cache, null, 2));

  // Summary
  console.log('\n╔══════════════════════════════════════════════════════════════╗');
  console.log('║     Summary                                                 ║');
  console.log('╠══════════════════════════════════════════════════════════════╣');
  console.log(`║  Fresh fetches:  ${String(success - cached).padStart(4)}                                   ║`);
  console.log(`║  From cache:    ${String(cached).padStart(4)}                                   ║`);
  console.log(`║  Failed:        ${String(failed).padStart(4)}                                   ║`);
  console.log(`║  Total:         ${String(azureModuleList.length).padStart(4)}                                   ║`);
  console.log('╚══════════════════════════════════════════════════════════════╝');

  if (errors.length > 0) {
    console.log('\n⚠ Errors/Warnings:');
    errors.forEach((e) => console.log(`  ${e}`));
  }

  console.log(`\nCache saved to: ${CACHE_FILE}`);
  console.log(`Schemas written to: ${SCHEMAS_DIR}`);
  console.log(`Templates written to: ${TEMPLATES_DIR}`);
}

main().catch((err) => {
  console.error('Fatal error:', err);
  process.exit(1);
});