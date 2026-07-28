const express = require('express');
const cors = require('cors');
const path = require('path');
const fs = require('fs');
const handlebars = require('handlebars');

// --- Handlebars Helper to safely output arrays from text ingestion ---
// BULLETPROOF: Wraps in SafeString to prevent Handlebars from HTML-escaping quotes into &quot;
handlebars.registerHelper('safeArray', function(items) {
    if (!items) return new handlebars.SafeString('[]');
    if (typeof items === 'string') return new handlebars.SafeString(`["${items}"]`);
    if (Array.isArray(items)) {
        return new handlebars.SafeString(`[${items.map(i => `"${i}"`).join(', ')}]`);
    }
    return new handlebars.SafeString('[]');
});

// --- Handlebars Helper to format Terraform resource names safely (Acronym Aware) ---
// Used for AWS/GCP/Azure resource type names (e.g., aws_instance -> aws_instance)
handlebars.registerHelper('snakeCase', function(str) {
    if (!str) return '';
    return str.replace(/[^a-zA-Z0-9]+/g, '_')
              .replace(/([a-z0-9])([A-Z])/g, '$1_$2')
              .replace(/([A-Z]+)([A-Z][a-z])/g, '$1_$2')
              .toLowerCase();
});

// --- Handlebars Helper for clean Terraform labels (Fixes DMZ-Database -> dmz_database) ---
// MUST match frontend normalizeToSnakeCase() exactly to ensure consistency
handlebars.registerHelper('tfLabel', function(str) {
    // BULLETPROOF: If str is missing, undefined, or an object (context leak), fallback safely
    if (typeof str !== 'string') return 'resource';
    
    // 1. Lowercase everything
    // 2. Replace any non-alphanumeric sequence with single underscore
    // 3. Strip leading/trailing underscores
    return str.toLowerCase().replace(/[^a-z0-9]+/g, '_').replace(/^_|_$/g, '');
});

// --- Handlebars Helper to check equality in templates (Required for Location blocks) ---
handlebars.registerHelper('eq', function(a, b, options) {
    // BULLETPROOF: Explicitly handle block helper {{#eq}} 
    // This guarantees the word "true" or "false" can NEVER leak into the generated HCL
    if (options && options.fn) {
        return (a === b) ? options.fn(this) : '';
    }
    return a === b;
});

// --- Handlebars Helper to lowercase strings (Required for GCP Locations & Labels) ---
handlebars.registerHelper('toLower', function(str) {
    return typeof str === 'string' ? str.toLowerCase() : str;
});

const app = express();
app.use(cors());
app.use(express.json());

// Serve React App
app.use(express.static(path.join(__dirname, 'client/dist')));

// Load Schemas
const DB_PATH = path.join(__dirname, 'db/schemas.json');
let db = { resources: {} };
if (fs.existsSync(DB_PATH)) {
    db = JSON.parse(fs.readFileSync(DB_PATH, 'utf8'));
} else {
    console.warn('WARNING: db/schemas.json not found. Run "npm run ingest" first.');
}

// Load External Modules
const REGISTRY_PATH = path.join(__dirname, 'db/modules/registry.json');
let moduleRegistry = { modules: [] };
if (fs.existsSync(REGISTRY_PATH)) {
    moduleRegistry = JSON.parse(fs.readFileSync(REGISTRY_PATH, 'utf8'));
}

// --- v2 FEATURE: Load Terraform Module Overrides (Invisible Upgrade) ---
const TF_OVERRIDES_PATH = path.join(__dirname, 'db/terraform_module_overrides.json');
let tfModuleOverrides = {};
if (fs.existsSync(TF_OVERRIDES_PATH)) {
    tfModuleOverrides = JSON.parse(fs.readFileSync(TF_OVERRIDES_PATH, 'utf8'));
    console.log(`[v2 Engine] Loaded ${Object.keys(tfModuleOverrides).length} Terraform module overrides.`);
} else {
    console.warn('[v2 Engine] WARNING: db/terraform_module_overrides.json not found. Using raw compiler.');
}

// --- 3RD PARTY AUDITOR VALIDATION: Bulk Address Objects ---
// Prevents empty "" = {} map keys and enforces strict schema compliance
function validateBulkAddresses(entries) {
    if (!Array.isArray(entries) || entries.length === 0) {
        throw new Error("At least one address object is required.");
    }

    const validTypes = new Set([
        "ip_netmask",
        "ip_range",
        "fqdn",
        "ip_wildcard"
    ]);

    for (const [index, entry] of entries.entries()) {
        // 1. Reject empty object names (Prevents "" = {} in HCL)
        if (!entry.name || !entry.name.trim()) {
            throw new Error(`Address entry ${index + 1} requires a valid object name.`);
        }

        // 2. Validate address type
        if (!validTypes.has(entry.address_type)) {
            throw new Error(`Address entry "${entry.name || index + 1}" has an invalid or missing address type.`);
        }

        // 3. Validate that the corresponding value field exists and is not empty
        const valueField = entry.address_type; 
        if (!entry[valueField] || !entry[valueField].trim()) {
            throw new Error(`Address entry "${entry.name}" is missing a value for "${valueField}".`);
        }

        // 4. Ensure tags is an array and has no empty strings (SafeArray compliance)
        if (entry.tags && !Array.isArray(entry.tags)) {
            throw new Error(`Tags for "${entry.name}" must be an array.`);
        }
        if (entry.tags && entry.tags.some(t => typeof t !== 'string' || t.trim() === "")) {
            throw new Error(`Tags array for "${entry.name}" contains empty strings, which violates SafeArray rules.`);
        }
    }
}

// --- DYNAMIC COMPILERS ---

function toSnakeCase(str) { return str.replace(/([A-Z])/g, '_$1').toLowerCase().replace(/^_/, ''); }

// --- TERRAFORM (Handles deep nested blocks) ---
function compileTerraform(schema, config, safeName) {
    const tfType = toSnakeCase(safeName);
    let hcl = `resource "${tfType}" "${tfType}_this" {\n`;
    hcl += compileTerraformProps(schema.properties, config, '  ');
    hcl += `}\n`;
    return hcl;
}

function compileTerraformProps(schemaProps, configNode, indent) {
    let hcl = '';
    for (const [key, value] of Object.entries(configNode)) {
        if (value === null || value === undefined || value === '') continue;
        const tfKey = toSnakeCase(key);
        const propSchema = schemaProps?.[key];

        if (typeof value === 'object' && !Array.isArray(value)) {
            hcl += `${indent}${tfKey} {\n`;
            hcl += compileTerraformProps(propSchema?.properties || {}, value, indent + '  ');
            hcl += `${indent}}\n`;
        } else if (Array.isArray(value) && value.length > 0 && typeof value[0] === 'object') {
            value.forEach(item => {
                hcl += `${indent}${tfKey} {\n`;
                hcl += compileTerraformProps(propSchema?.properties || {}, item, indent + '  ');
                hcl += `${indent}}\n`;
            });
        } else {
            hcl += `${indent}${tfKey} = ${convertToHcl(value)}\n`;
        }
    }
    return hcl;
}

function convertToHcl(value) {
    if (typeof value === 'string') return `"${value}"`;
    if (typeof value === 'number' || typeof value === 'boolean') return String(value);
    if (Array.isArray(value)) {
        if (value.length === 0) return '[]';
        if (typeof value[0] === 'string') return `["${value.join('", "')}"]`;
        return `[${value.map(v => typeof v === 'object' ? convertObjToHclInline(v) : v).join(', ')}]`;
    }
    if (typeof value === 'object') return convertObjToHclInline(value);
    return 'null';
}

function convertObjToHclInline(obj) {
    const lines = Object.entries(obj).map(([k, v]) => `    ${toSnakeCase(k)} = ${convertToHcl(v)}`);
    return `{\n${lines.join('\n')}\n  }`;
}


// --- BICEP (Handles deep nested objects) ---
function compileBicep(schema, config, safeName) {
    let bicep = `resource ${safeName} '${schema.typeName}' = {\n`;
    
    if (config.Name) bicep += `  name: '${config.Name}'\n`;
    if (config.Location) bicep += `  location: ${config.Location}\n`;
    
    const propsConfig = { ...config };
    delete propsConfig.Name;
    delete propsConfig.Location;
    
    // FIX: Extract tags to print at the resource root (Standard Bicep syntax)
    const resourceTags = propsConfig.Tags;
    delete propsConfig.Tags; 

    // Print Tags at the root level if they exist
    if (resourceTags) {
        if (typeof resourceTags === 'object') {
            bicep += `  tags: ${convertToBicep(resourceTags)}\n`;
        } else {
            // Fallback if someone passed a string instead of a JSON object
            bicep += `  tags: ${convertToBicep(resourceTags)}\n`;
        }
    }

    if (Object.keys(propsConfig).length > 0) {
        bicep += `  properties: {\n`;
        bicep += compileBicepProps(schema.properties?.properties || {}, propsConfig, '    ');
        bicep += `  }\n`;
    }
    
    bicep += `}\n`;
    return bicep;
}

function compileBicepProps(schemaProps, configNode, indent) {
    let bicep = '';
    for (const [key, value] of Object.entries(configNode)) {
        if (value === null || value === undefined || value === '') continue;
        const bicepKey = key.substring(0,1).toLowerCase() + key.substring(1);
        const propSchema = schemaProps?.[key];

        if (typeof value === 'object' && !Array.isArray(value)) {
            bicep += `${indent}${bicepKey}: {\n`;
            bicep += compileBicepProps(propSchema?.properties || {}, value, indent + '    ');
            bicep += `${indent}}\n`;
        } else if (Array.isArray(value)) {
            bicep += `${indent}${bicepKey}: [\n`;
            value.forEach(item => {
                if (typeof item === 'object') {
                    bicep += `${indent}  {\n`;
                    bicep += compileBicepProps(propSchema?.items?.properties || {}, item, indent + '    ');
                    bicep += `${indent}  }\n`;
                } else {
                    bicep += `${indent}  ${convertToBicep(item)}\n`;
                }
            });
            bicep += `${indent}]\n`;
        } else {
            bicep += `${indent}${bicepKey}: ${convertToBicep(value)}\n`;
        }
    }
    return bicep;
}

function convertToBicep(value) {
    if (typeof value === 'string') return `'${value}'`;
    if (typeof value === 'boolean') return value ? 'true' : 'false';
    if (typeof value === 'number') return String(value);
    if (Array.isArray(value)) return `[${value.map(v => typeof v === 'string' ? `'${v}'` : v).join(', ')}]`;
    
    // FIX: Handle objects (like Tags) properly for Bicep syntax { Key: 'Value' }
    if (typeof value === 'object' && value !== null) {
        const entries = Object.entries(value).map(([k, v]) => {
            const bicepValue = typeof v === 'string' ? `'${v}'` : convertToBicep(v);
            return `${k}: ${bicepValue}`;
        });
        return `{\n${entries.map(e => `    ${e}`).join('\n')}\n  }`;
    }
    
    return '{}';
}


// --- CDK PYTHON (Handles deep nested dictionaries) ---
function compileCdkPython(schema, config, safeName) {
    const [_, service, resource] = schema.typeName.split('::');
    const moduleName = service.toLowerCase();
    const className = `Cfn${resource}`;
    let py = `from aws_cdk_lib import ${moduleName}\n\n`;
    py += `${safeName} = ${moduleName}.${className}(\n`;
    py += `    scope, "${safeName}",\n`;
    
    py += compilePythonProps(schema.properties, config, '    ');
    
    py += `)\n`;
    return py;
}

function compilePythonProps(schemaProps, configNode, indent) {
    let py = '';
    for (const [key, value] of Object.entries(configNode)) {
        if (value === null || value === undefined || value === '') continue;
        const pyKey = toSnakeCase(key);
        const propSchema = schemaProps?.[key];

        if (typeof value === 'object' && !Array.isArray(value)) {
            py += `${indent}${pyKey}={\n`;
            py += compilePythonProps(propSchema?.properties || {}, value, indent + '    ');
            py += `${indent}},\n`;
        } else if (Array.isArray(value) && value.length > 0 && typeof value[0] === 'object') {
            py += `${indent}${pyKey}=[\n`;
            value.forEach(item => {
                py += `${indent}  {\n`;
                py += compilePythonProps(propSchema?.items?.properties || {}, item, indent + '    ');
                py += `${indent}  },\n`;
            });
            py += `${indent}],\n`;
        } else {
            py += `${indent}${pyKey}=${convertToPython(value)},\n`;
        }
    }
    return py;
}

function convertToPython(value) {
    if (typeof value === 'string') return `"${value}"`;
    if (typeof value === 'boolean') return value ? 'True' : 'False';
    if (typeof value === 'number') return String(value);
    if (Array.isArray(value)) return `["${value.join('", "')}"]`;
    return '{}';
}


// --- API ROUTES ---

app.get('/api/resources', (req, res) => {
    const { search } = req.query;
    let resources = Object.values(db.resources).map(r => ({ typeName: r.typeName, provider: r.provider }));
    
    moduleRegistry.modules.forEach(mod => {
        resources.push({ typeName: mod.id, provider: 'external', vendor: mod.vendor, deviceType: mod.deviceType, supportedPlatforms: mod.supportedPlatforms });
    });

    if (search) resources = resources.filter(r => r.typeName.toLowerCase().includes(search.toLowerCase()) || (r.vendor && r.vendor.toLowerCase().includes(search.toLowerCase())));
    
    res.json(resources);
});

app.get('/api/schema/:typeName', (req, res) => {
    const typeName = decodeURIComponent(req.params.typeName);
    if (db.resources[typeName]) return res.json(db.resources[typeName]);
    
    const modMeta = moduleRegistry.modules.find(m => m.id === typeName);
    if (modMeta) {
        const schemaPath = path.join(__dirname, 'db/modules', modMeta.schemaFile);
        const schema = JSON.parse(fs.readFileSync(schemaPath, 'utf8'));
        schema.supportedPlatforms = modMeta.supportedPlatforms;
        return res.json(schema);
    }
    res.status(404).json({ error: 'Not found' });
});

app.post('/api/generate', (req, res) => {
    const { typeName, platform, config } = req.body;
    let code = '';
    let language = 'plaintext';

    if (db.resources[typeName]) {
        const schema = db.resources[typeName];
        const safeName = typeName.replace(/[^a-zA-Z0-9]/g, '_').toLowerCase();
        
        if (platform === 'terraform') {
            // --- INVISIBLE UPGRADE: Intercept for Premium TF Modules ---
            const override = tfModuleOverrides[typeName];
            
            if (override) {
                console.log(`[v2 Engine] Intercepted ${typeName} -> Module Template.`);
                try {
                    const templatePath = path.join(__dirname, override.template);
                    const templateString = fs.readFileSync(templatePath, 'utf8');
                    const template = handlebars.compile(templateString);
                    
                    // DEVSECOPS: Deep clone config to prevent mutating req.body for other formats.
                    const safeConfig = JSON.parse(JSON.stringify(config));
                    
                    // SECURE JSON HANDLING: Validate and pretty-print PolicyDocument
                    if (safeConfig.PolicyDocument) {
                        try {
                            // Parse it whether it's an object or a pasted string (validates against injection)
                            const parsedPolicy = typeof safeConfig.PolicyDocument === 'string' 
                                ? JSON.parse(safeConfig.PolicyDocument) 
                                : safeConfig.PolicyDocument;
                            
                            // Re-stringify with 2-space indentation for clean, readable HCL output
                            safeConfig.PolicyDocument = JSON.stringify(parsedPolicy, null, 2);
                        } catch (e) {
                            // If it's not valid JSON at all, fail securely instead of outputting broken Terraform
                            return res.status(400).json({ success: false, error: "PolicyDocument must be valid JSON." });
                        }
                    }

                    // SECURE JSON HANDLING: Convert Tags/Labels to HCL Map syntax
                    const convertMapToHcl = (data, key, forceLowerCase = false) => {
                        if (data[key]) {
                            try {
                                let parsedMap = typeof data[key] === 'string' ? JSON.parse(data[key]) : data[key];
                                
                                // GCP Compliance: Enforce lowercase keys/values for labels
                                if (forceLowerCase) {
                                    const lowerMap = {};
                                    for (const [k, v] of Object.entries(parsedMap)) {
                                        lowerMap[k.toLowerCase()] = typeof v === 'string' ? v.toLowerCase() : v;
                                    }
                                    parsedMap = lowerMap;
                                }

                                let hclMap = JSON.stringify(parsedMap, null, 2);
                                // Strip commas for valid HCL map syntax
                                hclMap = hclMap.replace(/,/g, ''); 
                                hclMap = hclMap.replace(/"([^"]+)":/g, '$1 =');
                                data[key] = hclMap;
                            } catch (e) { /* Fail securely, leave as is */ }
                        }
                    };

                    convertMapToHcl(safeConfig, 'Tags');
                    convertMapToHcl(safeConfig, 'labels', true); // true = force GCP lowercase

                    // GCP: project_id fallback - use literal if provided, else reference variable
                    if (safeConfig.project_id && safeConfig.project_id.trim()) {
                        safeConfig.projectIdExpression = '"' + safeConfig.project_id.trim() + '"';
                    } else {
                        safeConfig.projectIdExpression = 'var.project_id';
                    }

                    code = template({ ...safeConfig, moduleVersion: override.version });
                    language = 'hcl';
                } catch (templateErr) {
                    console.error(`[DevSecOps] Template generation failed for ${typeName}:`, templateErr);
                    return res.status(500).json({ success: false, error: "Module template compilation failed." });
                }
            } else {
                // Fallback to v1 Raw Programmatic Compiler
                code = compileTerraform(schema, config, safeName); 
                language = 'hcl';
            }
        }
        else if (platform === 'bicep') { code = compileBicep(schema, config, safeName); language = 'bicep'; }
        else if (platform === 'cdk-python') { code = compileCdkPython(schema, config, safeName); language = 'python'; }
        else if (platform === 'cloudformation') { 
            code = JSON.stringify({ Resources: { [safeName]: { Type: typeName, Properties: config } } }, null, 2); 
            language = 'json'; 
        }
    } 
    else {
        const modMeta = moduleRegistry.modules.find(m => m.id === typeName);
        if (modMeta) {
            try {
                // --- RUN 3RD PARTY AUDITOR VALIDATION BEFORE TERRAFORM COMPILATION ---
                if (typeName === 'panos/panos_addresses') {
                    if (!config.addresses) {
                        throw new Error("Missing 'addresses' array in payload.");
                    }
                    validateBulkAddresses(config.addresses);
                }

                const templatePath = path.join(__dirname, 'db/modules', modMeta.templateFile);
                const templateString = fs.readFileSync(templatePath, 'utf8');
                const template = handlebars.compile(templateString);
                code = template({ resourceName: typeName.replace(/[^a-zA-Z0-9]/g, '_'), ...config });
                language = 'hcl';
            } catch (error) {
                // Intercept validation errors and return them to the React UI safely
                return res.status(400).json({ success: false, error: error.message });
            }
        } else {
            return res.status(404).json({ error: 'Resource type not found' });
        }
    }
    res.json({ success: true, code, language });
});

// --- SAFE DEPLOYMENT: Isolated v2 Port ---
const PORT = process.env.PORT || 3002;
app.listen(PORT, () => console.log(`🚀 IaC-Generator v2 running securely on http://localhost:${PORT}`));