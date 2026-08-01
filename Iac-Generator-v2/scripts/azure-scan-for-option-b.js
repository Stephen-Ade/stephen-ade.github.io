const fs = require('fs');
const path = require('path');

const SCHEMAS_FILE = path.join(__dirname, '..', 'db', 'schemas.json');

// We will dynamically extract Azure types from the file to avoid naming format mismatches
const AVM_MICROSOFT_TYPES = [
  "Microsoft.ApiManagement/service", "Microsoft.App/containerApps", "Microsoft.App/jobs", "Microsoft.App/managedEnvironments",
  "Microsoft.AppConfiguration/configurationStores", "Microsoft.ContainerInstance/containerGroups", "Microsoft.ContainerRegistry/registries",
  "Microsoft.ContainerService/managedClusters", "Microsoft.Web/hostingEnvironments", "Microsoft.Web/serverfarms", "Microsoft.Web/sites",
  "Microsoft.Web/staticSites", "Microsoft.Web/connections", "Microsoft.Authorization/roleAssignments", "Microsoft.Management/managementGroups",
  "Microsoft.Resources/resourceGroups", "Microsoft.Features/features", "Microsoft.ResourceGraph/queries", "Microsoft.Compute/capacityReservationGroups",
  "Microsoft.Compute/disks", "Microsoft.Compute/diskEncryptionSets", "Microsoft.Compute/galleries", "Microsoft.Compute/hostGroups",
  "Microsoft.Compute/proximityPlacementGroups", "Microsoft.Compute/sshPublicKeys", "Microsoft.Compute/virtualMachines", "Microsoft.Compute/virtualMachineScaleSets",
  "Microsoft.AVS/privateClouds", "Microsoft.AzureStackHCI/clusters", "Microsoft.AzureStackHCI/logicalNetworks", "Microsoft.AzureStackHCI/virtualMachineInstances",
  "Microsoft.HybridContainerService/provisionedClusterInstances", "Microsoft.Edge/sites", "Microsoft.Network/applicationGateways",
  "Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies", "Microsoft.Network/applicationSecurityGroups", "Microsoft.Network/azureFirewalls",
  "Microsoft.Network/bastionHosts", "Microsoft.Network/connections", "Microsoft.Network/ddosProtectionPlans", "Microsoft.Network/dnsResolvers",
  "Microsoft.Network/dnsZones", "Microsoft.Network/expressRouteCircuits", "Microsoft.Network/firewallPolicies", "Microsoft.Network/FrontDoorWebApplicationFirewallPolicies",
  "Microsoft.Network/ipGroups", "Microsoft.Network/loadBalancers", "Microsoft.Network/localNetworkGateways", "Microsoft.Network/natGateways",
  "Microsoft.Network/networkInterfaces", "Microsoft.Network/networkManagers", "Microsoft.Network/networkSecurityGroups", "Microsoft.Network/networkSecurityPerimeters",
  "Microsoft.Network/networkWatchers", "Microsoft.Network/privateDnsZones", "Microsoft.Network/privateEndpoints", "Microsoft.Network/publicIPAddresses",
  "Microsoft.Network/publicIPPrefixes", "Microsoft.Network/routeTables", "Microsoft.Network/trafficManagerProfiles", "Microsoft.Network/virtualNetworks",
  "Microsoft.KeyVault/vaults", "Microsoft.KeyVault/managedHSMs", "Microsoft.CertificateRegistration/certificateOrders", "Microsoft.Insights/autoscaleSettings",
  "Microsoft.Insights/components", "Microsoft.Insights/dataCollectionEndpoints", "Microsoft.Insights/dataCollectionRules", "Microsoft.OperationalInsights/workspaces",
  "Microsoft.Portal/dashboards", "Microsoft.Maintenance/maintenanceConfigurations", "Microsoft.Automation/automationAccounts", "Microsoft.CognitiveServices/accounts",
  "Microsoft.MachineLearningServices/workspaces", "Microsoft.Search/searchServices", "Microsoft.BotService/botServices", "Microsoft.Databricks/workspaces",
  "Microsoft.DocumentDB/databaseAccounts", "Microsoft.DocumentDB/mongoClusters", "Microsoft.DBforMySQL/flexibleServers", "Microsoft.DBforPostgreSQL/flexibleServers",
  "Microsoft.Kusto/clusters", "Microsoft.Sql/managedInstances", "Microsoft.Sql/servers", "Microsoft.SqlVirtualMachine/sqlVirtualMachines",
  "Microsoft.OracleDatabase/cloudExadataInfrastructures", "Microsoft.OracleDatabase/cloudVmClusters", "Microsoft.DataFactory/factories",
  "Microsoft.EventGrid/domains", "Microsoft.EventGrid/namespaces", "Microsoft.EventGrid/topics", "Microsoft.EventHub/namespaces", "Microsoft.ServiceBus/namespaces",
  "Microsoft.Relay/namespaces", "Microsoft.Logic/workflows", "Microsoft.Communication/emailServices", "Microsoft.Storage/storageAccounts",
  "Microsoft.NetApp/netAppAccounts", "Microsoft.DataProtection/backupVaults", "Microsoft.DataProtection/resourceGuards", "Microsoft.RecoveryServices/vaults",
  "Microsoft.DesktopVirtualization/applicationGroups", "Microsoft.DesktopVirtualization/hostPools", "Microsoft.DesktopVirtualization/scalingPlans",
  "Microsoft.DesktopVirtualization/workspaces", "Microsoft.DevCenter/devCenters", "Microsoft.DevOpsInfrastructure/pools", "Microsoft.Batch/batchAccounts",
  "Microsoft.Cache/redisEnterprise", "Microsoft.Cache/Redis", "Microsoft.Cdn/profiles", "Microsoft.RedHatOpenShift/OpenShiftClusters",
  "Microsoft.ManagedIdentity/userAssignedIdentities"
];

function hasNestedObjects(schema, depth = 0) {
  if (depth > 2 || !schema || typeof schema !== 'object') return false;
  if (schema.type === 'object' && schema.properties && Object.keys(schema.properties).length > 0) return true;
  if (schema.type === 'array' && schema.items && schema.items.type === 'object') return true;
  if (schema.properties) {
    for (const key in schema.properties) {
      if (hasNestedObjects(schema.properties[key], depth + 1)) return true;
    }
  }
  return false;
}

function run() {
  if (!fs.existsSync(SCHEMAS_FILE)) {
    console.error("ERROR: schemas.json not found at", SCHEMAS_FILE);
    return;
  }
  
  console.log("Parsing 5189 resources... (This will take a few seconds)");
  const raw = fs.readFileSync(SCHEMAS_FILE, 'utf8').replace(/^\uFEFF/, '');
  const data = JSON.parse(raw);
  const resources = data.resources;

  console.log("=========================================================");
  console.log(" SCAN RESULTS: Azure Resources Requiring 'Option B'");
  console.log("=========================================================\n");

  const optionBList = [];
  let safeCount = 0;
  let totalAzure = 0;

  for (const [typeName, schema] of Object.entries(resources)) {
    if (schema.provider !== 'azure') continue;
    totalAzure++;

    // Skip if it's an AVM (doing a rough string match in case format is Azure::RP::Res vs Microsoft.RP/Res)
    const isAvm = AVM_MICROSOFT_TYPES.some(avm => typeName.toLowerCase().includes(avm.split('/')[0].split('.')[1].toLowerCase()));
    if (isAvm) continue;

    if (schema.properties && hasNestedObjects({ properties: schema.properties })) {
      optionBList.push(typeName);
    } else {
      safeCount++;
    }
  }

  console.log(`[OPTION B REQUIRED - ${optionBList.length} Resources]:`);
  console.log("These will break v1 Bicep due to nested object stringification:\n");
  optionBList.sort().forEach(t => console.log(`  - ${t}`));

  console.log(`\n[SAFE FOR V1 - ${safeCount} Resources]:`);
  console.log("These are mostly flat and will compile fine in Bicep/ARM.");
  console.log(`\n(Total Azure resources scanned: ${totalAzure})`);

  console.log("\n=========================================================");
}

run();