const fs = require('fs');
const path = require('path');

// ==============================================================================
// ARCHITECTURAL CONFIGURATION
// ==============================================================================
const BASE_DIR = path.join(__dirname, '..');
const SCHEMAS_DIR = path.join(BASE_DIR, 'backend', 'schemas', 'avm');
const TEMPLATES_DIR = path.join(BASE_DIR, 'backend', 'templates', 'avm');
const OVERRIDES_FILE = path.join(BASE_DIR, 'db', 'terraform_module_overrides.json');

// Ensure output directories exist (Windows Safe: Pure Node.js)
if (!fs.existsSync(SCHEMAS_DIR)) fs.mkdirSync(SCHEMAS_DIR, { recursive: true });
if (!fs.existsSync(TEMPLATES_DIR)) fs.mkdirSync(TEMPLATES_DIR, { recursive: true });

// ==============================================================================
// AVM CATALOG DATA (Mapped to AzAPI schemas.json keys for interception)
// ==============================================================================
const avmCatalog = [
  { service: "API Management Service", azApiType: "Microsoft.ApiManagement/service", module: "avm-res-apimanagement-service" },
  { service: "Container App", azApiType: "Microsoft.App/containerApps", module: "avm-res-app-containerapp" },
  { service: "Container App Job", azApiType: "Microsoft.App/jobs", module: "avm-res-app-job" },
  { service: "Container Apps Managed Environment", azApiType: "Microsoft.App/managedEnvironments", module: "avm-res-app-managedenvironment" },
  { service: "App Configuration Store", azApiType: "Microsoft.AppConfiguration/configurationStores", module: "avm-res-appconfiguration-configurationstore" },
  { service: "Azure Container Instance", azApiType: "Microsoft.ContainerInstance/containerGroups", module: "avm-res-containerinstance-containergroup" },
  { service: "Azure Container Registry", azApiType: "Microsoft.ContainerRegistry/registries", module: "avm-res-containerregistry-registry" },
  { service: "AKS Managed Cluster", azApiType: "Microsoft.ContainerService/managedClusters", module: "avm-res-containerservice-managedcluster" },
  { service: "App Service Environment", azApiType: "Microsoft.Web/hostingEnvironments", module: "avm-res-web-hostingenvironment" },
  { service: "App Service Plan", azApiType: "Microsoft.Web/serverfarms", module: "avm-res-web-serverfarm" },
  { service: "Web App / Function App", azApiType: "Microsoft.Web/sites", module: "avm-res-web-site" },
  { service: "Static Web App", azApiType: "Microsoft.Web/staticSites", module: "avm-res-web-staticsite" },
  { service: "API Connection", azApiType: "Microsoft.Web/connections", module: "avm-res-web-connection" },
  { service: "Role Assignment", azApiType: "Microsoft.Authorization/roleAssignments", module: "avm-res-authorization-roleassignment" },
  { service: "Management Service Group", azApiType: "Microsoft.Management/managementGroups", module: "avm-res-management-servicegroup" },
  { service: "Azure Feature Exposure Control", azApiType: "Microsoft.Features/features", module: "avm-res-features-feature" },
  { service: "Resource Graph Query", azApiType: "Microsoft.ResourceGraph/queries", module: "avm-res-resourcegraph-query" },
  { service: "Capacity Reservation Group", azApiType: "Microsoft.Compute/capacityReservationGroups", module: "avm-res-compute-capacityreservationgroup" },
  { service: "Managed Disk", azApiType: "Microsoft.Compute/disks", module: "avm-res-compute-disk" },
  { service: "Disk Encryption Set", azApiType: "Microsoft.Compute/diskEncryptionSets", module: "avm-res-compute-diskencryptionset" },
  { service: "Azure Compute Gallery", azApiType: "Microsoft.Compute/galleries", module: "avm-res-compute-gallery" },
  { service: "Dedicated Host Group", azApiType: "Microsoft.Compute/hostGroups", module: "avm-res-compute-hostgroup" },
  { service: "Proximity Placement Group", azApiType: "Microsoft.Compute/proximityPlacementGroups", module: "avm-res-compute-proximityplacementgroup" },
  { service: "SSH Public Key", azApiType: "Microsoft.Compute/sshPublicKeys", module: "avm-res-compute-sshpublickey" },
  { service: "Virtual Machine", azApiType: "Microsoft.Compute/virtualMachines", module: "avm-res-compute-virtualmachine" },
  { service: "Virtual Machine Scale Set", azApiType: "Microsoft.Compute/virtualMachineScaleSets", module: "avm-res-compute-virtualmachinescaleset" },
  { service: "Azure VMware Solution Private Cloud", azApiType: "Microsoft.AVS/privateClouds", module: "avm-res-avs-privatecloud" },
  { service: "Azure Stack HCI Cluster", azApiType: "Microsoft.AzureStackHCI/clusters", module: "avm-res-azurestackhci-cluster" },
  { service: "Azure Stack HCI Logical Network", azApiType: "Microsoft.AzureStackHCI/logicalNetworks", module: "avm-res-azurestackhci-logicalnetwork" },
  { service: "Azure Stack HCI Virtual Machine Instance", azApiType: "Microsoft.AzureStackHCI/virtualMachineInstances", module: "avm-res-azurestackhci-virtualmachineinstance" },
  { service: "AKS Arc Provisioned Cluster Instance", azApiType: "Microsoft.HybridContainerService/provisionedClusterInstances", module: "avm-res-hybridcontainerservice-provisionedclusterinstance" },
  { service: "Azure Arc Site Manager", azApiType: "Microsoft.Edge/sites", module: "avm-res-edge-site" },
  { service: "Application Gateway", azApiType: "Microsoft.Network/applicationGateways", module: "avm-res-network-applicationgateway" },
  { service: "Application Gateway WAF Policy", azApiType: "Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies", module: "avm-res-network-applicationgatewaywebapplicationfirewallpolicy" },
  { service: "Application Security Group", azApiType: "Microsoft.Network/applicationSecurityGroups", module: "avm-res-network-applicationsecuritygroup" },
  { service: "Azure Firewall", azApiType: "Microsoft.Network/azureFirewalls", module: "avm-res-network-azurefirewall" },
  { service: "Azure Bastion Host", azApiType: "Microsoft.Network/bastionHosts", module: "avm-res-network-bastionhost" },
  { service: "Virtual Network Gateway Connection", azApiType: "Microsoft.Network/connections", module: "avm-res-network-connection" },
  { service: "DDoS Protection Plan", azApiType: "Microsoft.Network/ddosProtectionPlans", module: "avm-res-network-ddosprotectionplan" },
  { service: "Private DNS Resolver", azApiType: "Microsoft.Network/dnsResolvers", module: "avm-res-network-dnsresolver" },
  { service: "Public DNS Zone", azApiType: "Microsoft.Network/dnsZones", module: "avm-res-network-dnszone" },
  { service: "ExpressRoute Circuit", azApiType: "Microsoft.Network/expressRouteCircuits", module: "avm-res-network-expressroutecircuit" },
  { service: "Azure Firewall Policy", azApiType: "Microsoft.Network/firewallPolicies", module: "avm-res-network-firewallpolicy" },
  { service: "Front Door WAF Policy", azApiType: "Microsoft.Network/FrontDoorWebApplicationFirewallPolicies", module: "avm-res-network-frontdoorwebapplicationfirewallpolicy" },
  { service: "IP Group", azApiType: "Microsoft.Network/ipGroups", module: "avm-res-network-ipgroup" },
  { service: "Load Balancer", azApiType: "Microsoft.Network/loadBalancers", module: "avm-res-network-loadbalancer" },
  { service: "Local Network Gateway", azApiType: "Microsoft.Network/localNetworkGateways", module: "avm-res-network-localnetworkgateway" },
  { service: "NAT Gateway", azApiType: "Microsoft.Network/natGateways", module: "avm-res-network-natgateway" },
  { service: "Network Interface", azApiType: "Microsoft.Network/networkInterfaces", module: "avm-res-network-networkinterface" },
  { service: "Azure Virtual Network Manager", azApiType: "Microsoft.Network/networkManagers", module: "avm-res-network-networkmanager" },
  { service: "Network Security Group", azApiType: "Microsoft.Network/networkSecurityGroups", module: "avm-res-network-networksecuritygroup" },
  { service: "Network Security Perimeter", azApiType: "Microsoft.Network/networkSecurityPerimeters", module: "avm-res-network-networksecurityperimeter" },
  { service: "Network Watcher", azApiType: "Microsoft.Network/networkWatchers", module: "avm-res-network-networkwatcher" },
  { service: "Private DNS Zone", azApiType: "Microsoft.Network/privateDnsZones", module: "avm-res-network-privatednszone" },
  { service: "Private Endpoint", azApiType: "Microsoft.Network/privateEndpoints", module: "avm-res-network-privateendpoint" },
  { service: "Public IP Address", azApiType: "Microsoft.Network/publicIPAddresses", module: "avm-res-network-publicipaddress" },
  { service: "Public IP Prefix", azApiType: "Microsoft.Network/publicIPPrefixes", module: "avm-res-network-publicipprefix" },
  { service: "Route Table", azApiType: "Microsoft.Network/routeTables", module: "avm-res-network-routetable" },
  { service: "Traffic Manager Profile", azApiType: "Microsoft.Network/trafficManagerProfiles", module: "avm-res-network-trafficmanagerprofile" },
  { service: "Key Vault", azApiType: "Microsoft.KeyVault/vaults", module: "avm-res-keyvault-vault" },
  { service: "Key Vault Managed HSM", azApiType: "Microsoft.KeyVault/managedHSMs", module: "avm-res-keyvault-managedhsm" },
  { service: "Certificate Order", azApiType: "Microsoft.CertificateRegistration/certificateOrders", module: "avm-res-certificateregistration-certificateorder" },
  { service: "Autoscale Setting", azApiType: "Microsoft.Insights/autoscaleSettings", module: "avm-res-insights-autoscalesetting" },
  { service: "Application Insights", azApiType: "Microsoft.Insights/components", module: "avm-res-insights-component" },
  { service: "Data Collection Endpoint", azApiType: "Microsoft.Insights/dataCollectionEndpoints", module: "avm-res-insights-datacollectionendpoint" },
  { service: "Data Collection Rule", azApiType: "Microsoft.Insights/dataCollectionRules", module: "avm-res-insights-datacollectionrule" },
  { service: "Log Analytics Workspace", azApiType: "Microsoft.OperationalInsights/workspaces", module: "avm-res-operationalinsights-workspace" },
  { service: "Azure Portal Dashboard", azApiType: "Microsoft.Portal/dashboards", module: "avm-res-portal-dashboard" },
  { service: "Maintenance Configuration", azApiType: "Microsoft.Maintenance/maintenanceConfigurations", module: "avm-res-maintenance-maintenanceconfiguration" },
  { service: "Automation Account", azApiType: "Microsoft.Automation/automationAccounts", module: "avm-res-automation-automationaccount" },
  { service: "Azure AI / Cognitive Services Account", azApiType: "Microsoft.CognitiveServices/accounts", module: "avm-res-cognitiveservices-account" },
  { service: "Machine Learning Services Workspace", azApiType: "Microsoft.MachineLearningServices/workspaces", module: "avm-res-machinelearningservices-workspace" },
  { service: "Azure AI Search Service", azApiType: "Microsoft.Search/searchServices", module: "avm-res-search-searchservice" },
  { service: "Azure Bot Service", azApiType: "Microsoft.BotService/botServices", module: "avm-res-botservice-botservice" },
  { service: "Azure Databricks Workspace", azApiType: "Microsoft.Databricks/workspaces", module: "avm-res-databricks-workspace" },
  { service: "Cosmos DB Database Account", azApiType: "Microsoft.DocumentDB/databaseAccounts", module: "avm-res-documentdb-databaseaccount" },
  { service: "Cosmos DB for MongoDB vCore Cluster", azApiType: "Microsoft.DocumentDB/mongoClusters", module: "avm-res-documentdb-mongocluster" },
  { service: "MySQL Flexible Server", azApiType: "Microsoft.DBforMySQL/flexibleServers", module: "avm-res-dbformysql-flexibleserver" },
  { service: "PostgreSQL Flexible Server", azApiType: "Microsoft.DBforPostgreSQL/flexibleServers", module: "avm-res-dbforpostgresql-flexibleserver" },
  { service: "Azure Data Explorer / Kusto Cluster", azApiType: "Microsoft.Kusto/clusters", module: "avm-res-kusto-cluster" },
  { service: "SQL Managed Instance", azApiType: "Microsoft.Sql/managedInstances", module: "avm-res-sql-managedinstance" },
  { service: "Azure SQL Server", azApiType: "Microsoft.Sql/servers", module: "avm-res-sql-server" },
  { service: "SQL Virtual Machine", azApiType: "Microsoft.SqlVirtualMachine/sqlVirtualMachines", module: "avm-res-sqlvirtualmachine-sqlvirtualmachine" },
  { service: "Oracle Exadata Infrastructure", azApiType: "Microsoft.OracleDatabase/cloudExadataInfrastructures", module: "avm-res-oracledatabase-cloudexadatainfrastructure" },
  { service: "Oracle VM Cluster", azApiType: "Microsoft.OracleDatabase/cloudVmClusters", module: "avm-res-oracledatabase-cloudvmcluster" },
  { service: "Azure Data Factory", azApiType: "Microsoft.DataFactory/factories", module: "avm-res-datafactory-factory" },
  { service: "Event Grid Domain", azApiType: "Microsoft.EventGrid/domains", module: "avm-res-eventgrid-domain" },
  { service: "Event Grid Namespace", azApiType: "Microsoft.EventGrid/namespaces", module: "avm-res-eventgrid-namespace" },
  { service: "Event Grid Topic", azApiType: "Microsoft.EventGrid/topics", module: "avm-res-eventgrid-topic" },
  { service: "Event Hubs Namespace", azApiType: "Microsoft.EventHub/namespaces", module: "avm-res-eventhub-namespace" },
  { service: "Service Bus Namespace", azApiType: "Microsoft.ServiceBus/namespaces", module: "avm-res-servicebus-namespace" },
  { service: "Relay Namespace", azApiType: "Microsoft.Relay/namespaces", module: "avm-res-relay-namespace" },
  { service: "Logic Apps Workflow", azApiType: "Microsoft.Logic/workflows", module: "avm-res-logic-workflow" },
  { service: "Email Communication Service", azApiType: "Microsoft.Communication/emailServices", module: "avm-res-communication-emailservice" },
  { service: "Storage Account", azApiType: "Microsoft.Storage/storageAccounts", module: "avm-res-storage-storageaccount" },
  { service: "Azure NetApp Files Account", azApiType: "Microsoft.NetApp/netAppAccounts", module: "avm-res-netapp-netappaccount" },
  { service: "Data Protection Backup Vault", azApiType: "Microsoft.DataProtection/backupVaults", module: "avm-res-dataprotection-backupvault" },
  { service: "Data Protection Resource Guard", azApiType: "Microsoft.DataProtection/resourceGuards", module: "avm-res-dataprotection-resourceguard" },
  { service: "Recovery Services Vault", azApiType: "Microsoft.RecoveryServices/vaults", module: "avm-res-recoveryservices-vault" },
  { service: "Azure Virtual Desktop Application Group", azApiType: "Microsoft.DesktopVirtualization/applicationGroups", module: "avm-res-desktopvirtualization-applicationgroup" },
  { service: "Azure Virtual Desktop Host Pool", azApiType: "Microsoft.DesktopVirtualization/hostPools", module: "avm-res-desktopvirtualization-hostpool" },
  { service: "Azure Virtual Desktop Scaling Plan", azApiType: "Microsoft.DesktopVirtualization/scalingPlans", module: "avm-res-desktopvirtualization-scalingplan" },
  { service: "Azure Virtual Desktop Workspace", azApiType: "Microsoft.DesktopVirtualization/workspaces", module: "avm-res-desktopvirtualization-workspace" },
  { service: "Dev Center", azApiType: "Microsoft.DevCenter/devCenters", module: "avm-res-devcenter-devcenter" },
  { service: "Azure DevOps Managed Pool", azApiType: "Microsoft.DevOpsInfrastructure/pools", module: "avm-res-devopsinfrastructure-pool" },
  { service: "Azure Batch Account", azApiType: "Microsoft.Batch/batchAccounts", module: "avm-res-batch-batchaccount" },
  { service: "Azure Managed Redis", azApiType: "Microsoft.Cache/redisEnterprise", module: "avm-res-cache-redisenterprise" },
  { service: "Azure Cache for Redis", azApiType: "Microsoft.Cache/Redis", module: "avm-res-cache-redis" },
  { service: "CDN / Azure Front Door Profile", azApiType: "Microsoft.Cdn/profiles", module: "avm-res-cdn-profile" },
  { service: "Azure Red Hat OpenShift Cluster", azApiType: "Microsoft.RedHatOpenShift/OpenShiftClusters", module: "avm-res-redhatopenshift-openshiftcluster" }
];

// Modules we manually perfected in Session 1. Skip them to prevent overwrite.
const SKIP_MODULES = [
  "Microsoft.ManagedIdentity/userAssignedIdentities",
  "Microsoft.Resources/resourceGroups",
  "Microsoft.Network/virtualNetworks"
];

// ==============================================================================
// GENERATORS
// ==============================================================================

function generateSchema(serviceName) {
  // Baseline AVM interface: Every AVM resource requires these 4 inputs minimally.
  // This prevents AzAPI pollution (tenantId, etc) and gives the UI clean fields.
  return {
    "type": "object",
    "properties": {
      "name": {
        "type": "string",
        "title": "Resource Name",
        "description": `Name of the ${serviceName}`
      },
      "location": {
        "type": "string",
        "title": "Location",
        "description": "Azure region (e.g., eastus)",
        "default": "eastus"
      },
      "resource_group_name": {
        "type": "string",
        "title": "Resource Group Name",
        "description": "Existing Resource Group name"
      },
      "tags": {
        "type": "object",
        "title": "Tags",
        "description": "Resource tags (key-value pairs)"
      }
    },
    "required": ["name", "location", "resource_group_name"]
  };
}

function generateHcl(moduleName) {
  // Generic AVM HCL block. Backend's convertMapToHcl handles tag injection at runtime.
  return `terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "${moduleName}" {
  source  = "Azure/${moduleName}/azurerm"
  version = "x.x.x" # Version pinned by update-tf-modules.js

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
`;
}

// ==============================================================================
// EXECUTION
// ==============================================================================

function run() {
  console.log(`[Factory] Starting AVM Mass Generation for ${avmCatalog.length} modules...`);
  
  // Load existing overrides safely
  let existingOverrides = {};
  if (fs.existsSync(OVERRIDES_FILE)) {
    // Windows BOM protection just in case
    const raw = fs.readFileSync(OVERRIDES_FILE, 'utf8').replace(/^\uFEFF/, '');
    existingOverrides = JSON.parse(raw);
  }

  let generatedCount = 0;
  let skippedCount = 0;

  avmCatalog.forEach(item => {
    if (SKIP_MODULES.includes(item.azApiType)) {
      skippedCount++;
      return;
    }

    const schemaFileName = `${item.module}.schema.json`;
    const hclFileName = `${item.module}.hcl`;

    // 1. Write Schema File (Windows Safe)
    const schemaPath = path.join(SCHEMAS_DIR, schemaFileName);
    fs.writeFileSync(schemaPath, JSON.stringify(generateSchema(item.service), null, 2), 'utf8');

    // 2. Write HCL Template File (Windows Safe)
    const hclPath = path.join(TEMPLATES_DIR, hclFileName);
    fs.writeFileSync(hclPath, generateHcl(item.module), 'utf8');

    // 3. Build Override Object
    existingOverrides[item.azApiType] = {
      type: "module",
      source: `Azure/${item.module}/azurerm`,
      schemaFile: schemaFileName,
      hclTemplate: hclFileName,
      supportedPlatforms: ["terraform"] // UI LOCK: Hides Bicep/CFN
    };

    generatedCount++;
  });

  // 4. Write merged overrides (Windows Safe)
  fs.writeFileSync(OVERRIDES_FILE, JSON.stringify(existingOverrides, null, 2), 'utf8');

  console.log(`[Factory] Success!`);
  console.log(` -> Generated: ${generatedCount} new modules.`);
  console.log(` -> Skipped (existing): ${skippedCount} modules.`);
  console.log(` -> Schemas written to: ${SCHEMAS_DIR}`);
  console.log(` -> HCL written to: ${TEMPLATES_DIR}`);
  console.log(` -> Overrides merged into: ${OVERRIDES_FILE}`);
  console.log(`\n[Architect Note] Run 'node scripts/update-tf-modules.js' next to resolve live versions.`);
}

run();