const fs = require('fs');
const path = require('path');

const OVERRIDES_FILE = path.join(__dirname, '..', 'db', 'terraform_module_overrides.json');

// The 3 modules that returned 404 from the Terraform Registry
const FAILED_MODULES = [
  "Microsoft.AppConfiguration/configurationStores",
  "Microsoft.Network/networkSecurityPerimeters",
  "Microsoft.KeyVault/managedHSMs"
];

function run() {
  console.log("[Cleanup] Reading overrides file...");
  
  // Windows BOM Protection
  const raw = fs.readFileSync(OVERRIDES_FILE, 'utf8').replace(/^\uFEFF/, '');
  const overrides = JSON.parse(raw);

  let deletedCount = 0;

  FAILED_MODULES.forEach(key => {
    if (overrides[key]) {
      delete overrides[key];
      console.log(` ➡️  Removed: ${key}`);
      deletedCount++;
    } else {
      console.log(` ⚠️  Not found (already removed?): ${key}`);
    }
  });

  if (deletedCount > 0) {
    // Write back cleanly (Windows Safe: Pure Node.js)
    fs.writeFileSync(OVERRIDES_FILE, JSON.stringify(overrides, null, 2), 'utf8');
    console.log(`\n[Cleanup] Success! Removed ${deletedCount} invalid blocks.`);
  } else {
    console.log("\n[Cleanup] No changes needed.");
  }
}

run();