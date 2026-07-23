const fs = require('fs');
const path = require('path');

const OUTPUT_DIR = path.join(__dirname, '../db');
const OUTPUT_FILE = path.join(__dirname, '../db/schemas.json');
const AWS_LOCAL_FILE = path.join(__dirname, '../db/CloudFormationResourceSpecification.json');
const AZURE_INDEX_FILE = path.join(__dirname, '../db/azure-repo/generated/index.json');
const AZURE_TYPES_DIR = path.join(__dirname, '../db/azure-repo/generated/');
const GCP_LOCAL_FILE = path.join(__dirname, '../db/google-provider-schema.json');

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
                const parseAwsType = (p) => {
                    if (p.PrimitiveType) return p.PrimitiveType.toLowerCase();
                    if (p.Type === 'List') return 'array';
                    if (p.Type === 'Map') return 'object';
                    return (p.Type || 'object').toLowerCase();
                };

                const node = { type: parseAwsType(prop), description: prop.Description || '' };

                if (prop.Properties && Object.keys(prop.Properties).length > 0) {
                    node.properties = {};
                    Object.keys(prop.Properties).forEach(subName => {
                        const subProp = prop.Properties[subName];
                        const subNode = { type: parseAwsType(subProp), description: subProp.Description || '' };
                        if (subProp.Properties && Object.keys(subProp.Properties).length > 0) {
                            subNode.properties = {};
                            Object.keys(subProp.Properties).forEach(subSubName => {
                                subNode.properties[subSubName] = { type: parseAwsType(subProp.Properties[subSubName]), description: subProp.Properties[subSubName].Description || '' };
                            });
                        }
                        node.properties[subName] = subNode;
                    });
                }
                properties[propName] = node;
                if (prop.Required) required.push(propName);
            });
        }
        resources[typeName] = { typeName, provider: 'aws', properties, required };
    });
    return resources;
}

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

function getCleanType(node) {
    if (!node || !node.type) return 'object';
    if (typeof node.type === 'string') return node.type.toLowerCase();
    if (node.type.name) return node.type.name.toLowerCase();
    return 'object';
}

function resolveSchemaNode(fileData, node, depth = 0) {
    if (depth > 10 || !node || typeof node !== 'object') return node;
    
    if (node.type && typeof node.type === 'object' && node.type.$ref) {
        const resolvedType = resolveRef(fileData, node.type.$ref);
        if (typeof resolvedType === 'string') {
            node = { ...node, type: resolvedType };
        } else if (resolvedType && resolvedType.properties) {
            node = { ...resolvedType, description: node.description || resolvedType.description };
        }
    }

    if (node.$ref) {
        const resolved = resolveRef(fileData, node.$ref);
        return resolveSchemaNode(fileData, resolved, depth + 1);
    }

    if ((node.type === 'object' || !node.type) && node.properties) {
        const resolvedProps = {};
        for (const [k, v] of Object.entries(node.properties)) {
            resolvedProps[k] = resolveSchemaNode(fileData, v, depth + 1);
        }
        return { ...node, properties: resolvedProps };
    }

    if (node.type === 'array' && node.items) {
        return { ...node, items: resolveSchemaNode(fileData, node.items, depth + 1) };
    }

    return node;
}

function extractPropertiesFromNode(fileData, targetNode) {
    if (!targetNode) return null;
    const resolved = resolveSchemaNode(fileData, targetNode);
    
    if (resolved && resolved.properties) return resolved;
    
    const variant = resolved?.oneOf?.[0] || resolved?.allOf?.[0] || resolved?.anyOf?.[0];
    if (variant) {
        const resolvedVariant = resolveSchemaNode(fileData, variant);
        if (resolvedVariant && resolvedVariant.properties) return resolvedVariant;
    }
    
    return null;
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

        const [filePathPart, pointerPart] = ref.split('#');
        const filePath = path.join(AZURE_TYPES_DIR, filePathPart);
        
        if (!fs.existsSync(filePath)) continue;

        try {
            const fileData = JSON.parse(fs.readFileSync(filePath, 'utf8'));
            const wrapper = resolveRef(fileData, '#' + pointerPart);
            if (!wrapper || !wrapper.body) continue;

            let body = wrapper.body;
            if (body.$ref) body = resolveRef(fileData, body.$ref);
            if (!body || !body.properties) continue;

            const finalProps = {};
            const requiredList = body.required || [];

            for (const [propKey, propVal] of Object.entries(body.properties)) {
                if (['id', 'type', 'apiVersion'].includes(propKey)) continue;

                if (propKey === 'name') { finalProps.Name = { type: 'string', description: 'Resource name' }; continue; }
                if (propKey === 'location') { finalProps.Location = { type: 'string', description: 'Resource location' }; continue; }
                if (propKey === 'tags') { finalProps.Tags = { type: 'object', description: 'Resource tags' }; continue; }

                if (propKey === 'properties') {
                    let innerProps = propVal;
                    if (innerProps.$ref) innerProps = resolveRef(fileData, innerProps.$ref);
                    
                    const extractedNode = extractPropertiesFromNode(fileData, innerProps);
                    
                    if (extractedNode && extractedNode.properties) {
                        for (const [innerKey, innerVal] of Object.entries(extractedNode.properties)) {
                            const resolvedNode = resolveSchemaNode(fileData, innerVal);
                            
                            finalProps[innerKey] = {
                                type: getCleanType(resolvedNode),
                                description: resolvedNode.description || '',
                                properties: resolvedNode.properties || undefined 
                            };
                            if (extractedNode.required && extractedNode.required.includes(innerKey)) requiredList.push(innerKey);
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

// --- NEW: GCP PARSER ---
function parseGcpSchema(gcpSpec) {
    const resources = {};
    const schemas = gcpSpec.resource_schemas || {};
    const types = Object.keys(schemas);
    console.log(`[GCP] Parsing ${types.length} resource types...`);

    types.forEach(typeName => {
        const block = schemas[typeName].block;
        if (!block || !block.attributes) return;

        const properties = {};
        const required = [];

        for (const [attrName, attrVal] of Object.entries(block.attributes)) {
            // Skip auto-generated read-only fields that clutter the UI
            if (attrVal.computed && !attrVal.optional) continue;
            if (['id', 'self_link', 'project', 'zone', 'region', 'urn', 'effective_labels'].includes(attrName)) continue;

            let typeStr = 'string';
            if (attrVal.type) {
                if (Array.isArray(attrVal.type)) {
                    typeStr = attrVal.type.includes('list') ? 'array' : 'object';
                } else {
                    typeStr = attrVal.type.toLowerCase();
                }
            }

            const node = { type: typeStr, description: attrVal.description || '' };

            // Handle nested blocks (e.g., boot_disk, network_interface)
            if (attrVal.block && attrVal.block.attributes) {
                node.properties = {};
                for (const [subName, subVal] of Object.entries(attrVal.block.attributes)) {
                    if (subVal.computed && !subVal.optional) continue;
                    let subType = 'string';
                    if (subVal.type) {
                        subType = Array.isArray(subVal.type) ? (subVal.type.includes('list') ? 'array' : 'object') : subVal.type.toLowerCase();
                    }
                    node.properties[subName] = { type: subType, description: subVal.description || '' };
                }
            }

            properties[attrName] = node;
            if (attrVal.required) required.push(attrName);
        }

        if (Object.keys(properties).length > 0) {
            resources[typeName] = { typeName, provider: 'gcp', properties, required };
        }
    });
    return resources;
}

async function main() {
    if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

    console.log('Loading AWS CloudFormation Specification from local file...');
    const awsRaw = fs.readFileSync(AWS_LOCAL_FILE, 'utf8');
    const awsResources = parseAwsSchema(JSON.parse(awsRaw));

    let azureResources = {};
    if (fs.existsSync(AZURE_INDEX_FILE)) {
        console.log('Loading Azure DEEP schemas via reference map...');
        azureResources = parseAzureDeepSchemas();
    } else {
        console.warn('WARNING: Azure repo not extracted, skipping.');
    }

    let gcpResources = {};
    if (fs.existsSync(GCP_LOCAL_FILE)) {
        console.log('Loading GCP Terraform schemas...');
        const gcpRaw = fs.readFileSync(GCP_LOCAL_FILE, 'utf8');
        gcpResources = parseGcpSchema(JSON.parse(gcpRaw));
    } else {
        console.warn('WARNING: GCP schema not found, skipping.');
    }

    const db = {
        updatedAt: new Date().toISOString(),
        count: Object.keys(awsResources).length + Object.keys(azureResources).length + Object.keys(gcpResources).length,
        resources: { ...awsResources, ...azureResources, ...gcpResources }
    };
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(db, null, 2));
    console.log(`\nSuccess! Saved ${db.count} total resources to ${OUTPUT_FILE}`);
}

main().catch(err => console.error('Failed:', err.message));