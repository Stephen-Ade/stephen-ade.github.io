const fs = require('fs');
const path = require('path');
const filePath = path.join(__dirname, 'db/azure-repo/generated', 'addons/microsoft.addons/2017-05-15/types.json');
const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));

// Print the 18th item (index 17) to see what a resource looks like
console.log("Item 17:", JSON.stringify(data[17], null, 2));