const express = require('express');
const cors = require('cors');
const path = require('path');
const fs = require('fs');
const handlebars = require('handlebars');

// --- Handlebars Helper to safely output arrays from text ingestion ---
handlebars.registerHelper('safeArray', function(items) {
    if (!items) return '[]';
    if (typeof items === 'string') return `["${items}"]`;
    if (Array.isArray(items)) {
        return `[${items.map(i => `"${i}"`).join(', ')}]`;
    }
    return '[]';
});

// --- Handlebars Helper to format Terraform resource names safely (Acronym Aware) ---
handlebars.registerHelper('snakeCase', function(str) {
    if (!str) return '';
    return str.replace(/[^a-zA-Z0-9]+/g, '_')
              .replace(/([a-z0-9])([A-Z])/g, '$1_$2')
              .replace(/([A-Z]+)([A-Z][a-z])/g, '$1_$2')
              .toLowerCase();
});

// --- Handlebars Helper for clean Terraform labels (Fixes DMZ-Database -> dmz_database) ---
handlebars.registerHelper('tfLabel', function(str) {
    if (!str) return '';
    return str.replace(/-/g, '_').toLowerCase();
});

// --- Handlebars Helper to check equality in templates (Required for Location blocks) ---
handlebars.registerHelper('eq', function(a, b) {
    return a === b;
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
    delete propsConfig.Tags;

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
        
        if (platform === 'terraform') { code = compileTerraform(schema, config, safeName); language = 'hcl'; }
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
            const templatePath = path.join(__dirname, 'db/modules', modMeta.templateFile);
            const templateString = fs.readFileSync(templatePath, 'utf8');
            const template = handlebars.compile(templateString);
            code = template({ resourceName: typeName.replace(/[^a-zA-Z0-9]/g, '_'), ...config });
            language = 'hcl';
        } else {
            return res.status(404).json({ error: 'Resource type not found' });
        }
    }
    res.json({ success: true, code, language });
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));