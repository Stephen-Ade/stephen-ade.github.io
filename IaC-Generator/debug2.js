const fs = require('fs');
const path = require('path');
const filePath = path.join(__dirname, 'db/azure-repo/generated', 'addons/microsoft.addons/2017-05-15/types.json');
const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));

// Look at item 7 (the actual body)
console.log("Item 7 (The actual body):", JSON.stringify(data[7], null, 2).substring(0, 1000) + "\n\n... (truncated)");

// Check if it has properties
if (data[7].properties) {
    const keys = Object.keys(data[7].properties);
    console.log("PROPERTIES FOUND! Keys:", keys);
} else {
    console.log("No direct properties. It might be another $ref. Full item 7:", JSON.stringify(data[7]));
}