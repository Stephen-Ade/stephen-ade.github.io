const express = require('express');
const cors = require('cors');
const path = require('path');
const fs = require('fs');
const handlebars = require('handlebars');

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

function toSnakeCase(str) { return str.replace(/([A-Z])/g, '_$1').toLowerCase(); }

function compileTerraform(schema, config, safeName) {
    const tfKey = toSnakeCase(safeName);
    let hcl = `resource "${tfKey}" "${safeName}" {\n`;
    for (const [key, value] of Object.entries(config)) {
        if (value === null || value === undefined) continue;
        const propKey = toSnakeCase(key);
        hcl += `  ${propKey} = ${convertToHcl(value)}\n`;
    }
    hcl += `}\n`;
    return hcl;
}

function convertToHcl(value) {
    if (typeof value === 'string') return `"${value}"`;
    if (typeof value === 'number' || typeof value === 'boolean') return String(value);
    if (Array.isArray(value)) {
        if (value.length === 0) return '[]';
        if (typeof value[0] === 'string') return `["${value.join('", "')}"]`;
        return `[${value.map(v => typeof v === 'object' ? convertObjToHcl(v) : v).join(', ')}]`;
    }
    if (typeof value === 'object') return convertObjToHcl(value);
    return 'null';
}

function convertObjToHcl(obj) {
    const lines = Object.entries(obj).map(([k, v]) => `    ${toSnakeCase(k)} = ${convertToHcl(v)}`);
    return `{\n${lines.join('\n')}\n  }`;
}

function compileBicep(schema, config, safeName) {
    let bicep = `resource ${safeName} '${schema.typeName}' = {\n  name: '${config.name || safeName}'\n  properties: {\n`;
    for (const [key, value] of Object.entries(config)) {
        if (['name', 'type'].includes(key.toLowerCase())) continue;
        const propKey = key.substring(0,1).toLowerCase() + key.substring(1);
        bicep += `    ${propKey}: ${convertToBicep(value)}\n`;
    }
    bicep += `  }\n}\n`;
    return bicep;
}

function convertToBicep(value) {
    if (typeof value === 'string') return `'${value}'`;
    if (typeof value === 'boolean') return value ? 'true' : 'false';
    if (typeof value === 'number') return String(value);
    if (Array.isArray(value)) return `[${value.map(v => typeof v === 'string' ? `'${v}'` : v).join(', ')}]`;
    return '{}'; // Simplified object handling
}

function compileCdkPython(schema, config, safeName) {
    const [_, service, resource] = schema.typeName.split('::');
    const moduleName = service.toLowerCase();
    const className = `Cfn${resource}`;
    let py = `from aws_cdk_lib import ${moduleName}\n\n`;
    py += `${safeName} = ${moduleName}.${className}(\n`;
    py += `    scope, "${safeName}",\n`;
    for (const [key, value] of Object.entries(config)) {
        pyKey = toSnakeCase(key);
        py += `    ${pyKey}=${convertToPython(value)},\n`;
    }
    py += `)\n`;
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
    
    // Add External Modules
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

    // Handle Native Cloud Resources
    if (db.resources[typeName]) {
        const schema = db.resources[typeName];
        const safeName = typeName.replace(/[^a-zA-Z0-9]/g, '_').toLowerCase();
        if (platform === 'terraform') { code = compileTerraform(schema, config, safeName); language = 'hcl'; }
        else if (platform === 'bicep') { code = compileBicep(schema, config, safeName); language = 'bicep'; }
        else if (platform === 'cdk-python') { code = compileCdkPython(schema, config, safeName); language = 'python'; }
        else if (platform === 'cloudformation') { code = JSON.stringify({ Resources: { [safeName]: { Type: typeName, Properties: config } } }, null, 2); language = 'json'; }
    } 
    // Handle External Modules
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