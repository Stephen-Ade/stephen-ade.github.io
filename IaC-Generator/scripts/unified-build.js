const fs = require('fs');
const path = require('path');

const OUTPUT_DIR = path.join(__dirname, '../db');
const OUTPUT_FILE = path.join(__dirname, '../db/schemas.json');
const AWS_LOCAL_FILE = path.join(__dirname, '../db/CloudFormationResourceSpecification.json');
const AZURE_INDEX_FILE = path.join(__dirname, '../db/azure-repo/generated/index.json');
const AZURE_TYPES_DIR = path.join(__dirname, '../db/azure-repo/generated/');

function parseAwsSchema(cfnSpec) {
    const resources = {};
    const types = Object.keys(cfnSpec.ResourceTypes);
    console.log(`[AWS] Parsing ${types.length} resource types with full deep properties...`);
    types.forEach(typeName => {
        const cfnResource = cfnSpec.ResourceTypes[typeName];
        const properties = {};
        const required = [];
        if (cfnResource.Properties) {
            Object.keys(cfnResource.Properties).forEach(propName => {
                const prop = cfnResource.Properties[propName];
                properties[propName] = { type: prop.PrimitiveType ? prop.PrimitiveType.toLowerCase() : 'object', description: prop.Description || '' };
                if (prop.Required) required.push(propName);
            });
        }
        resources[typeName] = { typeName, provider: 'aws', properties, required };
    });
    return resources;
}

function parseAzureDeepSchemas() {
    const resources = {};
    const indexRaw = fs.readFileSync(AZURE_INDEX_FILE, 'utf8');
    const index = JSON.parse(indexRaw);
    const indexResources = index.resources || {};
    let count = 0;
    let skipped = 0;

    for (const key in indexResources) {
        const ref = indexResources[key].$ref;
        if (!ref) continue;

        // key = "Microsoft.Compute/virtualMachines@2023-01-01"
        const lastAtIdx = key.lastIndexOf('@');
        let typeName = key.substring(0, lastAtIdx);

        // ref = "types/Microsoft.Compute/virtualMachines/2023-01-01.json"
        const filePath = path.join(AZURE_TYPES_DIR, ref);
        
        if (!fs.existsSync(filePath)) {
            skipped++;
            continue;
        }

        try {
            const schemaRaw = fs.readFileSync(filePath, 'utf8');
            const schema = JSON.parse(schemaRaw);

            if (schema.properties) {
                const properties = {};
                const required = schema.required || [];
                
                for (const propName in schema.properties) {
                    if (['id', 'type', 'apiVersion'].includes(propName)) continue;
                    const prop = schema.properties[propName];
                    properties[propName] = { type: prop.type || 'object', description: prop.description || '' };
                }
                
                // Overwrite to keep only the latest version of the resource
                resources[typeName] = { typeName, provider: 'azure', properties, required };
                count++;
            }
        } catch (e) {
            // Silently skip broken individual files
        }
    }
    console.log(`[Azure] Parsed ${count} resource types with DEEP properties. (Skipped ${skipped} non-standard types)`);
    return resources;
}

async function main() {
    if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

    console.log('Loading AWS CloudFormation Specification from local file...');
    const awsRaw = fs.readFileSync(AWS_LOCAL_FILE, 'utf8');
    const awsResources = parseAwsSchema(JSON.parse(awsRaw));

    if (!fs.existsSync(AZURE_INDEX_FILE)) {
        console.error('ERROR: Azure repo not extracted! Run the PowerShell download commands first.');
        return;
    }

    console.log('Loading Azure DEEP schemas from extracted repo files...');
    const azureResources = parseAzureDeepSchemas();

    const db = {
        updatedAt: new Date().toISOString(),
        count: Object.keys(awsResources).length + Object.keys(azureResources).length,
        resources: { ...awsResources, ...azureResources }
    };
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(db, null, 2));
    console.log(`\nSuccess! Saved ${db.count} resources to ${OUTPUT_FILE}`);
}

main().catch(err => console.error('Failed:', err.message));