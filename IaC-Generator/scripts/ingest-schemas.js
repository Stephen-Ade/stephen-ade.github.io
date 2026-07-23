const axios = require('axios');
const fs = require('fs');
const path = require('path');

// Updated URLs (AWS moved to GitHub, Azure is unchanged)
const AWS_SPEC_URL = 'https://raw.githubusercontent.com/aws-cloudformation/cfn-language-spec/main/spec/CloudFormationResourceSpecification.json';
const AZURE_TYPES_URL = 'https://raw.githubusercontent.com/Azure/bicep-types-az/main/generated/index.json';

const OUTPUT_DIR = path.join(__dirname, '../db');
const OUTPUT_FILE = path.join(OUTPUT_DIR, 'schemas.json');

function parseAwsSchema(cfnSpec) {
    const resources = {};
    const types = Object.keys(cfnSpec.ResourceTypes);
    console.log(`[AWS] Found ${types.length} resource types. Parsing...`);
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

function parseAzureSchema(azureSpec) {
    const resources = {};
    let count = 0;
    const providers = Object.keys(azureSpec);
    console.log(`[Azure] Parsing ${providers.length} providers...`);
    providers.forEach(providerName => {
        const providerResources = azureSpec[providerName]?.resources;
        if (!providerResources) return;
        Object.keys(providerResources).forEach(resourceName => {
            const typeName = `${providerName}/${resourceName}`;
            const azureResource = providerResources[resourceName];
            const apiVersions = Object.keys(azureResource).filter(k => k.match(/^\d{4}-\d{2}-\d{2}/)).sort().reverse();
            if (apiVersions.length === 0) return;
            const schema = azureResource[apiVersions[0]];
            if (!schema || !schema.properties) return;
            const properties = {};
            const required = schema.required || [];
            Object.keys(schema.properties).forEach(propName => {
                if (['id', 'type', 'apiVersion'].includes(propName)) return;
                const prop = schema.properties[propName];
                properties[propName] = { type: prop.type || 'object' };
            });
            resources[typeName] = { typeName, provider: 'azure', properties, required };
            count++;
        });
    });
    console.log(`[Azure] Parsed ${count} resource types.`);
    return resources;
}

async function main() {
    if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });
    console.log('Fetching AWS CloudFormation Specification...');
        const awsResponse = await axios.get(AWS_SPEC_URL, { headers: { 'User-Agent': 'Mozilla/5.0', 'Accept-Encoding': 'gzip' } });
    console.log('Fetching Azure Bicep Types Index...');
    const azureResponse = await axios.get(AZURE_TYPES_URL);
    const awsResources = parseAwsSchema(awsResponse.data);
    const azureResources = parseAzureSchema(azureResponse.data);
    const db = {
        updatedAt: new Date().toISOString(),
        count: Object.keys(awsResources).length + Object.keys(azureResources).length,
        resources: { ...awsResources, ...azureResources }
    };
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(db, null, 2));
    console.log(`\nSuccess! Saved ${db.count} resources to ${OUTPUT_FILE}`);
}

main().catch(err => console.error('Ingestion failed:', err.message));