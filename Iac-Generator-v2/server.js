const express = require('express');
const cors = require('cors');
const path = require('path');
const fs = require('fs');
const handlebars = require('handlebars');

// DEVSECOPS: Windows BOM Stripper
const parseJsonSafe = (filePath) => {
    let raw = fs.readFileSync(filePath, 'utf8').replace(/^\uFEFF/, '');
    return JSON.parse(raw);
};

// --- Handlebars Helpers ---
handlebars.registerHelper('safeArray', function(items) {
    if (!items) return new handlebars.SafeString('[]');
    if (typeof items === 'string') return new handlebars.SafeString(`["${items}"]`);
    if (Array.isArray(items)) {
        return new handlebars.SafeString(`[${items.map(i => `"${i}"`).join(', ')}]`);
    }
    return new handlebars.SafeString('[]');
});

handlebars.registerHelper('snakeCase', function(str) {
    if (!str) return '';
    return str.replace(/[^a-zA-Z0-9]+/g, '_')
              .replace(/([a-z0-9])([A-Z])/g, '$1_$2')
              .replace(/([A-Z]+)([A-Z][a-z])/g, '$1_$2')
              .toLowerCase();
});

handlebars.registerHelper('tfLabel', function(str) {
    if (typeof str !== 'string') return 'resource';
    return str.toLowerCase().replace(/[^a-z0-9]+/g, '_').replace(/^_|_$/g, '');
});

handlebars.registerHelper('eq', function(a, b, options) {
    if (options && options.fn) {
        return (a === b) ? options.fn(this) : '';
    }
    return a === b;
});

handlebars.registerHelper('toLower', function(str) {
    return typeof str === 'string' ? str.toLowerCase() : str;
});

handlebars.registerHelper('hclVal', function(value) {
    if (value === null || value === undefined) return 'null';
    if (typeof value === 'boolean') return String(value);
    if (typeof value === 'number') return String(value);
    if (typeof value === 'string') {
        if (/^\s*\{[^}]*=\s*["\[\{]/.test(value) || /^\s*\[/.test(value)) {
            return value;
        }
        const trimmed = value.trim();
        if ((trimmed.startsWith('{') && trimmed.endsWith('}')) ||
            (trimmed.startsWith('[') && trimmed.endsWith(']'))) {
            try {
                const parsed = JSON.parse(trimmed);
                return convertToHcl(parsed);
            } catch (e) { /* fall through */ }
        }
        return `"${value}"`;
    }
    if (typeof value === 'object') {
        return convertToHcl(value);
    }
    return String(value);
});

const app = express();
app.use(cors());
app.use(express.json());

app.use(express.static(path.join(__dirname, 'client/dist')));

// --- Load Data ---
const DB_PATH = path.join(__dirname, 'db/schemas.json');
let db = { resources: {} };
if (fs.existsSync(DB_PATH)) {
    db = parseJsonSafe(DB_PATH);
} else {
    console.warn('WARNING: db/schemas.json not found.');
}

const REGISTRY_PATH = path.join(__dirname, 'db/modules/registry.json');
let moduleRegistry = { modules: [] };
if (fs.existsSync(REGISTRY_PATH)) {
    moduleRegistry = parseJsonSafe(REGISTRY_PATH);
}

const TF_OVERRIDES_PATH = path.join(__dirname, 'db/terraform_module_overrides.json');
let tfModuleOverrides = {};
if (fs.existsSync(TF_OVERRIDES_PATH)) {
    tfModuleOverrides = parseJsonSafe(TF_OVERRIDES_PATH);
    console.log(`[v2 Engine] Loaded ${Object.keys(tfModuleOverrides).length} Terraform module overrides.`);
}

// --- Build AVM set for resource list tagging ---
const avmOverrideTypeNames = new Set(
    Object.entries(tfModuleOverrides)
        .filter(([, v]) => v.type === 'module' && v.source && v.source.includes('/avm-'))
        .map(([k]) => k)
);
console.log(`[v2 Engine] ${avmOverrideTypeNames.size} Azure AVM resources will be tagged in resource list.`);

// --- Validation ---
function validateBulkAddresses(entries) {
    if (!Array.isArray(entries) || entries.length === 0) {
        throw new Error("At least one address object is required.");
    }
    const validTypes = new Set(["ip_netmask", "ip_range", "fqdn", "ip_wildcard"]);
    for (const [index, entry] of entries.entries()) {
        if (!entry.name || !entry.name.trim()) {
            throw new Error(`Address entry ${index + 1} requires a valid object name.`);
        }
        if (!validTypes.has(entry.address_type)) {
            throw new Error(`Address entry "${entry.name || index + 1}" has an invalid or missing address type.`);
        }
        const valueField = entry.address_type; 
        if (!entry[valueField] || !entry[valueField].trim()) {
            throw new Error(`Address entry "${entry.name}" is missing a value for "${valueField}".`);
        }
        if (entry.tags && !Array.isArray(entry.tags)) {
            throw new Error(`Tags for "${entry.name}" must be an array.`);
        }
        if (entry.tags && entry.tags.some(t => typeof t !== 'string' || t.trim() === "")) {
            throw new Error(`Tags array for "${entry.name}" contains empty strings.`);
        }
    }
}

// --- Compilers ---
function toSnakeCase(str) { 
    if (typeof str !== 'string') return str;
    if (/^[A-Z][A-Z0-9_]*$/.test(str)) return str;
    return str.replace(/([A-Z])/g, '_$1').toLowerCase().replace(/^_/, ''); 
}

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
            const lowerKey = tfKey.toLowerCase();
            if (lowerKey === 'tags' || lowerKey === 'labels') {
                const mapLines = Object.entries(value).map(([k, v]) => `${indent}  ${k} = ${convertToHcl(v)}`);
                hcl += `${indent}${tfKey} = {\n${mapLines.join('\n')}\n${indent}}\n`;
            } else {
                hcl += `${indent}${tfKey} {\n`;
                hcl += compileTerraformProps(propSchema?.properties || {}, value, indent + '  ');
                hcl += `${indent}}\n`;
            }
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

function compileBicep(schema, config, safeName) {
    let bicep = `resource ${safeName} '${schema.typeName}' = {\n`;
    if (config.Name) bicep += `  name: '${config.Name}'\n`;
    if (config.Location) bicep += `  location: ${config.Location}\n`;
    const propsConfig = { ...config };
    delete propsConfig.Name;
    delete propsConfig.Location;
    const resourceTags = propsConfig.Tags;
    delete propsConfig.Tags;
    if (resourceTags) bicep += `  tags: ${convertToBicep(resourceTags)}\n`;
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
    if (typeof value === 'object' && value !== null) {
        const entries = Object.entries(value).map(([k, v]) => `${k}: ${typeof v === 'string' ? `'${v}'` : convertToBicep(v)}`);
        return `{\n${entries.map(e => `    ${e}`).join('\n')}\n  }`;
    }
    return '{}';
}

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

function parseStringifiedObjects(config) {
    if (!config) return config;
    const parsed = { ...config };
    for (const [key, value] of Object.entries(parsed)) {
        if (typeof value === 'string') {
            const trimmed = value.trim();
            if ((trimmed.startsWith('{') && trimmed.endsWith('}')) ||
                (trimmed.startsWith('[') && trimmed.endsWith(']'))) {
                try { parsed[key] = JSON.parse(trimmed); } catch (e) { /* leave as is */ }
            }
        }
    }
    return parsed;
}

// --- API ROUTES ---

app.get('/api/resources', (req, res) => {
    const { search } = req.query;
    let resources = [];

    // 1. Add ALL resources from schemas.json (AWS, Azure, GCP, etc.) - no filtering
    Object.values(db.resources).forEach(r => {
        resources.push({ typeName: r.typeName, provider: r.provider });
    });

    // 2. Add 3rd party modules (PANOS, etc.)
    moduleRegistry.modules.forEach(mod => {
        resources.push({ typeName: mod.id, provider: 'external', vendor: mod.vendor, deviceType: mod.deviceType, supportedPlatforms: mod.supportedPlatforms });
    });

    // 3. Add Azure AVM modules with explicit "Azure AVM" vendor tag
    //    These appear alongside the schemas.json Azure entries, distinguished by vendor
    avmOverrideTypeNames.forEach(typeName => {
        const override = tfModuleOverrides[typeName];
        resources.push({
            typeName: typeName,
            provider: 'azure',
            vendor: 'Azure AVM',
            supportedPlatforms: override.supportedPlatforms || ['terraform']
        });
    });

    if (search) {
        const searchLower = search.toLowerCase();
        resources = resources.filter(r => 
            r.typeName.toLowerCase().includes(searchLower) || 
            (r.vendor && r.vendor.toLowerCase().includes(searchLower))
        );
    }
    
    res.json(resources);
});

app.get('/api/schema/:typeName', (req, res) => {
    const typeName = decodeURIComponent(req.params.typeName);
    
    // AVM schema swap - takes priority when user clicks an AVM-tagged resource
    if (tfModuleOverrides[typeName]) {
        const override = tfModuleOverrides[typeName];
        if (override.type === 'module') {
            const overrideSchemaPath = path.join(__dirname, 'backend', 'schemas', 'avm', override.hclTemplate.replace('.hcl', '.schema.json'));
            if (fs.existsSync(overrideSchemaPath)) {
                const overrideSchema = parseJsonSafe(overrideSchemaPath);
                overrideSchema.typeName = typeName;
                overrideSchema.provider = 'azure';
                overrideSchema.description = override.source;
                overrideSchema.supportedPlatforms = ['terraform'];
                return res.json(overrideSchema);
            }
        }
    }
    
    // Standard schema lookup
    if (db.resources[typeName]) return res.json(db.resources[typeName]);
    
    const modMeta = moduleRegistry.modules.find(m => m.id === typeName);
    if (modMeta) {
        const schemaPath = path.join(__dirname, 'db/modules', modMeta.schemaFile);
        const schema = parseJsonSafe(schemaPath);
        schema.supportedPlatforms = modMeta.supportedPlatforms;
        return res.json(schema);
    }
    res.status(404).json({ error: 'Not found' });
});

app.post('/api/generate', (req, res) => {
    const { typeName, platform, config } = req.body;
    let code = '';
    let language = 'plaintext';

    if (db.resources[typeName] || tfModuleOverrides[typeName]) {
        const schema = db.resources[typeName] || {};
        const safeName = typeName.replace(/[^a-zA-Z0-9]/g, '_').toLowerCase();
        
        // Block non-Terraform for AVM modules
        if (tfModuleOverrides[typeName] && platform !== 'terraform' && tfModuleOverrides[typeName].type === 'module') {
            return res.status(400).json({ 
                success: false, 
                error: `This resource is configured to use a premium Terraform module. Native ${platform} generation is not supported for this resource.` 
            });
        }

        if (platform === 'terraform') {
            const override = tfModuleOverrides[typeName];
            
            if (override) {
                console.log(`[v2 Engine] Intercepted ${typeName} -> Module Template.`);
                try {
                    const templateDir = override.type === 'resource' ? 'aws' : 'avm';
                    const templatePath = path.join(__dirname, 'backend', 'templates', templateDir, override.hclTemplate);
                    
                    const templateString = fs.readFileSync(templatePath, 'utf8');
                    const template = handlebars.compile(templateString);
                    const safeConfig = JSON.parse(JSON.stringify(config));
                    
                    if (safeConfig.PolicyDocument) {
                        try {
                            const parsedPolicy = typeof safeConfig.PolicyDocument === 'string' 
                                ? JSON.parse(safeConfig.PolicyDocument) 
                                : safeConfig.PolicyDocument;
                            safeConfig.PolicyDocument = JSON.stringify(parsedPolicy, null, 2);
                        } catch (e) {
                            return res.status(400).json({ success: false, error: "PolicyDocument must be valid JSON." });
                        }
                    }

                    if (override.type === 'resource') {
                        let awsProps = safeConfig.properties;
                        if (!awsProps || (typeof awsProps === 'object' && Object.keys(awsProps).length === 0)) {
                            awsProps = { ...safeConfig };
                            delete awsProps.id;
                            delete awsProps.properties;
                        }
                        if (typeof awsProps === 'string') {
                            try { awsProps = JSON.parse(awsProps); }
                            catch (e) { return res.status(400).json({ success: false, error: "Properties must be valid JSON." }); }
                        }
                        awsProps = parseStringifiedObjects(awsProps);
                        
                        const convertPropsToHcl = (props, indent = '  ') => {
                            let hcl = '';
                            for (const [key, value] of Object.entries(props || {})) {
                                if (value === null || value === undefined || value === '') continue;
                                const tfKey = toSnakeCase(key);
                                if (typeof value === 'object' && !Array.isArray(value)) {
                                    const lowerKey = tfKey.toLowerCase();
                                    if (lowerKey === 'tags' || lowerKey === 'labels') {
                                        const mapLines = Object.entries(value).map(([k, v]) => `${indent}  ${k} = ${convertToHcl(v)}`);
                                        hcl += `${indent}${tfKey} = {\n${mapLines.join('\n')}\n${indent}}\n`;
                                    } else {
                                        hcl += `${indent}${tfKey} {\n`;
                                        hcl += convertPropsToHcl(value, indent + '  ');
                                        hcl += `${indent}}\n`;
                                    }
                                } else if (Array.isArray(value) && value.length > 0 && typeof value[0] === 'object') {
                                    value.forEach(item => {
                                        hcl += `${indent}${tfKey} {\n`;
                                        hcl += convertPropsToHcl(item, indent + '  ');
                                        hcl += `${indent}}\n`;
                                    });
                                } else {
                                    hcl += `${indent}${tfKey} = ${convertToHcl(value)}\n`;
                                }
                            }
                            return hcl;
                        };
                        const dynamicHcl = convertPropsToHcl(awsProps);
                        const finalHcl = `resource "${override.tfResourceType}" "this" {\n${dynamicHcl}}`;
                        return res.send({ code: finalHcl, language: 'hcl' });
                    }

                    const convertMapToHcl = (data, key, forceLowerCase = false) => {
                        if (data[key]) {
                            try {
                                let parsedMap = typeof data[key] === 'string' ? JSON.parse(data[key]) : data[key];
                                if (forceLowerCase) {
                                    const lowerMap = {};
                                    for (const [k, v] of Object.entries(parsedMap)) {
                                        lowerMap[k.toLowerCase()] = typeof v === 'string' ? v.toLowerCase() : v;
                                    }
                                    parsedMap = lowerMap;
                                }
                                let hclMap = JSON.stringify(parsedMap, null, 2);
                                hclMap = hclMap.replace(/,/g, ''); 
                                hclMap = hclMap.replace(/"([^"]+)":/g, '$1 =');
                                data[key] = hclMap;
                            } catch (e) { /* fail securely */ }
                        }
                    };

                    convertMapToHcl(safeConfig, 'Tags');
                    convertMapToHcl(safeConfig, 'tags');
                    convertMapToHcl(safeConfig, 'labels', true);

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
                code = compileTerraform(schema, config, safeName); 
                language = 'hcl';
            }
        }
        else if (platform === 'bicep') { code = compileBicep(schema, config, safeName); language = 'bicep'; }
        else if (platform === 'cdk-python') { 
            const parsedConfig = parseStringifiedObjects(config);
            code = compileCdkPython(schema, parsedConfig, safeName); 
            language = 'python'; 
        }
        else if (platform === 'cloudformation') { 
            const parsedConfig = parseStringifiedObjects(config);
            code = JSON.stringify({ Resources: { [safeName]: { Type: typeName, Properties: parsedConfig } } }, null, 2); 
            language = 'json'; 
        }
    } 
    else {
        const modMeta = moduleRegistry.modules.find(m => m.id === typeName);
        if (modMeta) {
            try {
                if (typeName === 'panos/panos_addresses') {
                    if (!config.addresses) throw new Error("Missing 'addresses' array in payload.");
                    validateBulkAddresses(config.addresses);
                }
                const templatePath = path.join(__dirname, 'db/modules', modMeta.templateFile);
                const templateString = fs.readFileSync(templatePath, 'utf8');
                const template = handlebars.compile(templateString);
                code = template({ resourceName: typeName.replace(/[^a-zA-Z0-9]/g, '_'), ...config });
                language = 'hcl';
            } catch (error) {
                return res.status(400).json({ success: false, error: error.message });
            }
        } else {
            return res.status(404).json({ error: 'Resource type not found' });
        }
    }
    res.json({ success: true, code, language });
});

const PORT = process.env.PORT || 3002;
app.listen(PORT, () => console.log(`🚀 IaC-Generator v2 running securely on http://localhost:${PORT}`));