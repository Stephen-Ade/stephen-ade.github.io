const j = require('./db/azure-repo/generated/index.json');
const firstKey = Object.keys(j.resources)[0];
console.log('Key:', firstKey);
console.log('Ref:', j.resources[firstKey]['$ref']);