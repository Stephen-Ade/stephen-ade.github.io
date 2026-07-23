const axios = require('axios');
const fs = require('fs');
const path = require('path');

const OUTPUT_DIR = path.join(__dirname, '../db');
const OUTPUT_FILE = path.join(OUTPUT_DIR, 'schemas.json');
const AWS_LOCAL_FILE = path.join(__dirname, '../db/CloudFormationResourceSpecification.json');
const AZURE_URL = 'https://raw.githubusercontent.com/Azure/bicep-types-az/main/generated/index.json';

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

    // 1. Load AWS from the file you downloaded via your browser
    if (!fs.existsSync(AWS_LOCAL_FILE)) {
        console.error('ERROR: CloudFormationResourceSpecification.json not found in the db folder!');
        console.error('Please download it from: https://d1uauaxba7bl26.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json');
        return;
    }
    console.log('Loading AWS CloudFormation Specification from local file...');
    const awsRaw = fs.readFileSync(AWS_LOCAL_FILE, 'utf8');
    const awsResources = parseAwsSchema(JSON.parse(awsRaw));

    // 2. Fetch Azure dynamically from GitHub (GitHub allows this)
    console.log('Fetching Azure Bicep Types Index dynamically...');
    const azureResponse = await axios.get(AZURE_URL);
    const azureResources = parseAzureSchema(azureResponse.data);

    // 3. Merge and Save
    const db = {
        updatedAt: new Date().toISOString(),
        count: Object.keys(awsResources).length + Object.keys(azureResources).length,
        resources: { ...awsResources, ...azureResources }
    };
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(db, null, 2));
    console.log(`\nSuccess! Saved ${db.count} resources to ${OUTPUT_FILE}`);
    console.log('(Note: AWS resources now contain their FULL official properties!)');
}

main().catch(err => console.error('Ingestion failed:', err.message));