const axios = require('axios');
const fs = require('fs');
const path = require('path');

// DevSecOps: Strict input validation for module sources to prevent SSRF or injection
const VALID_NAMESPACE_REGEX = /^[a-zA-Z0-9_-]+\/[a-zA-Z0-9_-]+\/[a-zA-Z0-9_-]+$/;

const OVERRIDES_PATH = path.join(__dirname, '..', 'db', 'terraform_module_overrides.json');

async function updateModuleVersions() {
    if (!fs.existsSync(OVERRIDES_PATH)) {
        console.error('[DevSecOps] ERROR: db/terraform_module_overrides.json not found.');
        process.exit(1);
    }

    // Read current overrides
    const overrides = JSON.parse(fs.readFileSync(OVERRIDES_PATH, 'utf8'));
    let updatesMade = false;

    console.log(`[Updater] Starting version check for ${Object.keys(overrides).length} module(s)...\n`);

    for (const [cspType, config] of Object.entries(overrides)) {
        // Extract clean module path (e.g., "terraform-aws-modules/iam/aws" from the double-slash submodule path)
        const modulePath = config.source.split('//')[0];

        if (!VALID_NAMESPACE_REGEX.test(modulePath)) {
            console.warn(`[DevSecOps] SKIP: Invalid source format for ${cspType} -> ${modulePath}`);
            continue;
        }

        try {
            console.log(`[Checker] Querying Registry for: ${modulePath}`);
            
            // Hit the official Terraform Registry API
            const response = await axios.get(`https://registry.terraform.io/v1/modules/${modulePath}`, {
                headers: { 'Accept': 'application/json' }
            });

            const latestVersion = response.data.version;
            const currentVersion = config.version;

            if (latestVersion !== currentVersion) {
                console.log(`  ➡️  UPDATE FOUND! Current: ${currentVersion} -> Latest: ${latestVersion}`);
                config.version = latestVersion;
                updatesMade = true;
            } else {
                console.log(`  ✅ Up to date (${currentVersion})`);
            }
        } catch (error) {
            console.error(`  ❌ FAILED: Could not fetch ${modulePath} (Status: ${error.response?.status || 'N/A'})`);
        }
    }

    // Save back to disk if updates were found
    if (updatesMade) {
        fs.writeFileSync(OVERRIDES_PATH, JSON.stringify(overrides, null, 2));
        console.log('\n[Updater] ✅ Overrides file successfully updated with latest versions.');
    } else {
        console.log('\n[Updater] All modules are already on the latest version. No changes made.');
    }
}

// Execute the script
updateModuleVersions();