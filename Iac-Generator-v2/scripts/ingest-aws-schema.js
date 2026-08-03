const axios = require('axios');
const fs = require('fs');
const path = require('path');

// --- Configuration ---
const GITHUB_API = 'https://api.github.com/repos/hashicorp/terraform-provider-aws/releases/latest';
const SCHEMA_BASE_URL = 'https://raw.githubusercontent.com/hashicorp/terraform-provider-aws';
const DB_DIR = path.join(__dirname, '..', 'db');
const OUTPUT_FILE = path.join(DB_DIR, 'schemas.json');
const VERSION_FILE = path.join(DB_DIR, '.aws-schema-version.json');
const MIN_SIZE_BYTES = 20 * 1024 * 1024; // 20MB safety threshold

async function main() {
    if (!fs.existsSync(DB_DIR)) fs.mkdirSync(DB_DIR, { recursive: true });

    // 1. Fetch latest release metadata from official GitHub API
    console.log('[Ingest] Querying GitHub API for latest terraform-provider-aws release...');
    let latestVersion;
    try {
        const response = await axios.get(GITHUB_API, {
            headers: { 'Accept': 'application/vnd.github.v3+json' }
        });
        latestVersion = response.data.tag_name; // e.g., "v5.80.0"
        console.log(`[Ingest] Latest official release found: ${latestVersion}`);
    } catch (err) {
        console.error('[DevSecOps] Failed to query GitHub API. Aborting.');
        process.exit(1);
    }

    // 2. Check if we already have this version (Idempotency)
    if (fs.existsSync(VERSION_FILE)) {
        const current = JSON.parse(fs.readFileSync(VERSION_FILE, 'utf8'));
        if (current.version === latestVersion) {
            console.log(`[Ingest] ✅ db/schemas.json is already up to date (${latestVersion}). No action needed.`);
            return;
        }
        console.log(`[Ingest] Update available: ${current.version} -> ${latestVersion}`);
    }

    // 3. Download the 44MB schema file securely from the immutable release tag
    const downloadUrl = `${SCHEMA_BASE_URL}/${latestVersion}/internal/schemas/schemas.json`;
    console.log(`[Ingest] Downloading from: ${downloadUrl}`);
    console.log('[Ingest] Streaming to temporary file (this may take 10-30 seconds)...');

    const tempFile = OUTPUT_FILE + '.tmp';
    
    try {
        const response = await axios.get(downloadUrl, {
            responseType: 'stream',
            headers: { 'Accept': 'application/json' }
        });

        // DEVSECOPS: Pre-flight size check on headers
        const contentLength = response.headers['content-length'];
        if (contentLength && parseInt(contentLength) < MIN_SIZE_BYTES) {
            throw new Error(`SECURITY VIOLATION: Remote file size (${contentLength} bytes) is suspiciously small. Aborting.`);
        }

        const writer = fs.createWriteStream(tempFile);
        response.data.pipe(writer);

        await new Promise((resolve, reject) => {
            writer.on('finish', resolve);
            writer.on('error', reject);
        });

    } catch (err) {
        // Cleanup temp file if download failed
        if (fs.existsSync(tempFile)) fs.unlinkSync(tempFile);
        console.error(`[DevSecOps] Download failed: ${err.message}`);
        process.exit(1);
    }

    // 4. Post-download validation
    const stats = fs.statSync(tempFile);
    if (stats.size < MIN_SIZE_BYTES) {
        fs.unlinkSync(tempFile);
        throw new Error(`SECURITY VIOLATION: Saved file size (${stats.size} bytes) is too small. Download likely returned an error page.`);
    }

    console.log(`[Ingest] Download complete. Validating JSON structure...`);
    try {
        // Node handles 44MB JSON fine, but we only need to check the root keys
        const fileContent = fs.readFileSync(tempFile, 'utf8');
        const testData = JSON.parse(fileContent);
        
        // Verify it's actually a Terraform provider schema
        if (!testData.provider_schemas || !testData.format_version) {
            fs.unlinkSync(tempFile);
            throw new Error('VALIDATION FAILED: File does not contain expected Terraform schema keys.');
        }
    } catch (err) {
        if (fs.existsSync(tempFile)) fs.unlinkSync(tempFile);
        console.error(`[DevSecOps] ${err.message}`);
        process.exit(1);
    }

    // 5. Atomic swap: Replace old file only after validation passes
    if (fs.existsSync(OUTPUT_FILE)) {
        fs.unlinkSync(OUTPUT_FILE);
    }
    fs.renameSync(tempFile, OUTPUT_FILE);

    // 6. Update version manifest
    fs.writeFileSync(VERSION_FILE, JSON.stringify({
        version: latestVersion,
        sizeMb: (stats.size / 1024 / 1024).toFixed(2),
        updatedAt: new Date().toISOString()
    }, null, 2));

    console.log(`\n[Ingest] ✅ SUCCESS!`);
    console.log(`[Ingest] Updated db/schemas.json to AWS Provider ${latestVersion} (${(stats.size / 1024 / 1024).toFixed(2)} MB)`);
}

main();