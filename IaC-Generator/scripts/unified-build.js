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

// Helper to follow Microsoft's "#/7" pointers
function resolveRef(rootData, refString) {
    if (!refString || !refString.startsWith('#/')) return null;
    const parts = refString.substring(2).split('/').map(p => isNaN(p) ? p : parseInt(p));
    let current = rootData;
    for (const p of parts) {
        if (current[p] === undefined) return null;
        current = current[p];
    }
    return current;
}

function parseAzureDeepSchemas() {
    const resources = {};
    const indexRaw = fs.readFileSync(AZURE_INDEX_FILE, 'utf8');
    const index = JSON.parse(indexRaw);
    const indexResources = index.resources || {};
    let count = 0;

    for (const key in indexResources) {
        const ref = indexResources[key].$ref;
        if (!ref) continue;

        const lastAtIdx = key.lastIndexOf('@');
        let typeName = key.substring(0, lastAtIdx);

        // ref = "addons/microsoft.addons/2017-05-15/types.json#/17"
        const [filePathPart, pointerPart] = ref.split('#');
        const filePath = path.join(AZURE_TYPES_DIR, filePathPart);
        
        if (!fs.existsSync(filePath)) continue;

        try {
            const fileData = JSON.parse(fs.readFileSync(filePath, 'utf8'));
            
            // 1. Follow pointer to the Resource Wrapper (e.g., #/17)
            const wrapper = resolveRef(fileData, '#' + pointerPart);
            if (!wrapper || !wrapper.body) continue;

            // 2. Follow the body pointer to the actual Object Type (e.g., #/7)
            let body = wrapper.body;
            if (body.$ref) {
                body = resolveRef(fileData, body.$ref);
            }
            if (!body || !body.properties) continue;

            const finalProps = {};
            const requiredList = body.required || [];

            // 3. Extract properties
            for (const [propKey, propVal] of Object.entries(body.properties)) {
                // Skip standard read-only ARM properties
                if (['id', 'type', 'apiVersion'].includes(propKey)) continue;

                if (propKey === 'name') {
                    finalProps.Name = { type: 'string', description: 'Resource name' };
                    continue;
                }
                if (propKey === 'location') {
                    finalProps.Location = { type: 'string', description: 'Resource location' };
                    continue;
                }
                if (propKey === 'tags') {
                    finalProps.Tags = { type: 'object', description: 'Resource tags' };
                    continue;
                }

                // The real deep settings are inside the "properties" property
                if (propKey === 'properties') {
                    let innerProps = propVal;
                    // Resolve if it's another pointer
                    if (innerProps.$ref) {
                        innerProps = resolveRef(fileData, innerProps.$ref);
                    }
                    
                    if (innerProps && innerProps.properties) {
                        for (const [innerKey, innerVal] of Object.entries(innerProps.properties)) {
                            // Figure out the type (handle nested $refs gracefully)
                            let typeStr = 'object';
                            if (innerVal.type) {
                                if (typeof innerVal.type === 'string') typeStr = innerVal.type.toLowerCase();
                                else if (innerVal.type.name) typeStr = innerVal.type.name.toLowerCase();
                                else if (innerVal.type.$ref) typeStr = 'object'; // complex type
                            }
                            
                            finalProps[innerKey] = {
                                type: typeStr,
                                description: innerVal.description || ''
                            };

                            if (innerProps.required && innerProps.required.includes(innerKey)) {
                                requiredList.push(innerKey);
                            }
                        }
                    }
                    continue;
                }
            }

            if (Object.keys(finalProps).length > 0) {
                resources[typeName] = { typeName, provider: 'azure', properties: finalProps, required: requiredList };
                count++;
            }
        } catch (e) {
            // Skip broken files silently
        }
    }
    console.log(`[Azure] Parsed ${count} resource types with DEEP properties.`);
    return resources;
}

async function main() {
    if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

    console.log('Loading AWS CloudFormation Specification from local file...');
    const awsRaw = fs.readFileSync(AWS_LOCAL_FILE, 'utf8');
    const awsResources = parseAwsSchema(JSON.parse(awsRaw));

    if (!fs.existsSync(AZURE_INDEX_FILE)) {
        console.error('ERROR: Azure repo not extracted!');
        return;
    }

    console.log('Loading Azure DEEP schemas via reference map...');
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