Write-Host "========================================" -ForegroundColor Cyan
Write-Host " IaC Generator - Schema Setup Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

 $dbFolder = ".\db"

# Ensure db folder exists
if (-not (Test-Path $dbFolder)) {
    New-Item -ItemType Directory -Path $dbFolder -Force | Out-Null
}

Write-Host "`n[1/4] Downloading AWS CloudFormation Specification..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://d1uauaxba7bl26.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json" -OutFile "$dbFolder\CloudFormationResourceSpecification.json" -UseBasicParsing
Write-Host "      -> AWS file downloaded successfully." -ForegroundColor Green

Write-Host "`n[2/4] Downloading Azure Bicep Types Index..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Azure/bicep-types-az/main/generated/index.json" -OutFile "$dbFolder\azure-types.json" -UseBasicParsing
Write-Host "      -> Azure file downloaded successfully." -ForegroundColor Green

Write-Host "`n[3/4] Downloading GCP Terraform Provider Schema..." -ForegroundColor Yellow
# FIX: Using a specific version tag because HashiCorp removed it from the 'main' branch
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/hashicorp/terraform-provider-google/v5.11.0/google/provider_schema.json" -OutFile "$dbFolder\google-provider-schema.json" -UseBasicParsing
Write-Host "      -> GCP file downloaded successfully." -ForegroundColor Green

Write-Host "`n[4/4] Parsing and combining schemas..." -ForegroundColor Yellow
node scripts/unified-build.js

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host " Setup Complete! You can now run:" -ForegroundColor Green
Write-Host " node server.js" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan