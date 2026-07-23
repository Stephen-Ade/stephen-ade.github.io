const fs = require('fs');
const path = require('path');

const OUTPUT_DIR = path.join(__dirname, '../db');
const OUTPUT_FILE = path.join(OUTPUT_DIR, 'schemas.json');
const AWS_LOCAL_FILE = path.join(__dirname, '../db/CloudFormationResourceSpecification.json');

// Your exact Azure list
const azureResources = [
  "Microsoft.Authorization/denyAssignments","Microsoft.Authorization/locks","Microsoft.Authorization/policyAssignments",
  "Microsoft.Authorization/policyDefinitions","Microsoft.Authorization/policySetDefinitions","Microsoft.Authorization/roleAssignments",
  "Microsoft.Authorization/roleDefinitions","Microsoft.Blueprint/blueprints","Microsoft.Blueprint/blueprints/artifacts",
  "Microsoft.KeyVault/managedHSMs","Microsoft.KeyVault/vaults","Microsoft.KeyVault/vaults/keys","Microsoft.KeyVault/vaults/secrets",
  "Microsoft.ManagedIdentity/userAssignedIdentities","Microsoft.ManagedServices/registrationAssignments",
  "Microsoft.ManagedServices/registrationDefinitions","Microsoft.Management/managementGroups","Microsoft.Resources/deployments",
  "Microsoft.Resources/deploymentScripts","Microsoft.Resources/resourceGroups","Microsoft.Resources/templateSpecs",
  "Microsoft.Security/automations","Microsoft.Security/contacts","Microsoft.Security/pricings","Microsoft.Security/standards",
  "Microsoft.SecurityInsights/alertRules","Microsoft.SecurityInsights/automationRules","Microsoft.SecurityInsights/dataConnectors",
  "Microsoft.SecurityInsights/hunts","Microsoft.SecurityInsights/watchlists","Microsoft.Cdn/profiles",
  "Microsoft.Cdn/profiles/afdEndpoints","Microsoft.Cdn/profiles/endpoints","Microsoft.Cdn/profiles/originGroups",
  "Microsoft.Cdn/profiles/origins","Microsoft.Cdn/profiles/ruleSets","Microsoft.Cdn/profiles/securityPolicies",
  "Microsoft.Network/applicationGateways","Microsoft.Network/applicationSecurityGroups","Microsoft.Network/azureFirewalls",
  "Microsoft.Network/bastionHosts","Microsoft.Network/connections","Microsoft.Network/ddosProtectionPlans",
  "Microsoft.Network/dnsZones","Microsoft.Network/dnsZones/A","Microsoft.Network/dnsZones/CNAME","Microsoft.Network/dnsZones/MX",
  "Microsoft.Network/expressRouteCircuits","Microsoft.Network/firewallPolicies","Microsoft.Network/frontDoors",
  "Microsoft.Network/loadBalancers","Microsoft.Network/localNetworkGateways","Microsoft.Network/natGateways",
  "Microsoft.Network/networkInterfaces","Microsoft.Network/networkSecurityGroups","Microsoft.Network/networkWatchers",
  "Microsoft.Network/privateDnsZones","Microsoft.Network/privateDnsZones/virtualNetworkLinks","Microsoft.Network/privateEndpoints",
  "Microsoft.Network/privateLinkServices","Microsoft.Network/publicIPAddresses","Microsoft.Network/publicIPPrefixes",
  "Microsoft.Network/routeTables","Microsoft.Network/trafficManagerProfiles","Microsoft.Network/virtualHubs",
  "Microsoft.Network/virtualNetworkGateways","Microsoft.Network/virtualNetworks","Microsoft.Network/virtualNetworks/subnets",
  "Microsoft.Network/virtualWans","Microsoft.Network/vpnGateways","Microsoft.Network/vpnSites",
  "Microsoft.App/containerApps","Microsoft.App/jobs","Microsoft.App/managedEnvironments","Microsoft.AVS/privateClouds",
  "Microsoft.Batch/batchAccounts","Microsoft.Batch/batchAccounts/pools","Microsoft.Compute/availabilitySets",
  "Microsoft.Compute/dedicatedHosts","Microsoft.Compute/disks","Microsoft.Compute/galleries","Microsoft.Compute/galleries/images",
  "Microsoft.Compute/galleries/images/versions","Microsoft.Compute/hostGroups","Microsoft.Compute/images",
  "Microsoft.Compute/proximityPlacementGroups","Microsoft.Compute/snapshots","Microsoft.Compute/sshPublicKeys",
  "Microsoft.Compute/virtualMachines","Microsoft.Compute/virtualMachineScaleSets","Microsoft.ContainerInstance/containerGroups",
  "Microsoft.ContainerRegistry/registries","Microsoft.ContainerService/managedClusters","Microsoft.ContainerService/managedClusters/agentPools",
  "Microsoft.DesktopVirtualization/applicationGroups","Microsoft.DesktopVirtualization/hostPools","Microsoft.DesktopVirtualization/workspaces",
  "Microsoft.Web/hostingEnvironments","Microsoft.Web/serverfarms","Microsoft.Web/sites","Microsoft.Web/sites/config",
  "Microsoft.Web/sites/slots","Microsoft.Web/staticSites","Microsoft.DataBox/jobs","Microsoft.DataBoxEdge/dataBoxEdgeDevices",
  "Microsoft.DataProtection/backupVaults","Microsoft.DataProtection/backupVaults/backupPolicies","Microsoft.ImportExport/jobs",
  "Microsoft.NetApp/netAppAccounts","Microsoft.NetApp/netAppAccounts/capacityPools","Microsoft.NetApp/netAppAccounts/capacityPools/volumes",
  "Microsoft.RecoveryServices/vaults","Microsoft.RecoveryServices/vaults/backupPolicies",
  "Microsoft.RecoveryServices/vaults/replicationPolicies","Microsoft.Storage/storageAccounts",
  "Microsoft.Storage/storageAccounts/blobServices","Microsoft.Storage/storageAccounts/blobServices/containers",
  "Microsoft.Storage/storageAccounts/fileServices","Microsoft.Storage/storageAccounts/fileServices/shares",
  "Microsoft.Storage/storageAccounts/localUsers","Microsoft.Storage/storageAccounts/managementPolicies",
  "Microsoft.Storage/storageAccounts/queueServices","Microsoft.Storage/storageAccounts/queueServices/queues",
  "Microsoft.Storage/storageAccounts/tableServices","Microsoft.Storage/storageAccounts/tableServices/tables",
  "Microsoft.AnalysisServices/servers","Microsoft.Cache/redis","Microsoft.Cache/redisEnterprise",
  "Microsoft.Cache/redisEnterprise/databases","Microsoft.Databricks/workspaces","Microsoft.DataFactory/factories",
  "Microsoft.DataFactory/factories/datasets","Microsoft.DataFactory/factories/linkedservices","Microsoft.DataFactory/factories/pipelines",
  "Microsoft.DBforMySQL/flexibleServers","Microsoft.DBforMySQL/flexibleServers/databases","Microsoft.DBforPostgreSQL/flexibleServers",
  "Microsoft.DBforPostgreSQL/flexibleServers/databases","Microsoft.DocumentDB/databaseAccounts",
  "Microsoft.DocumentDB/databaseAccounts/cassandraKeyspaces","Microsoft.DocumentDB/databaseAccounts/mongodbDatabases",
  "Microsoft.DocumentDB/databaseAccounts/sqlDatabases","Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers",
  "Microsoft.ElasticSan/elasticSans","Microsoft.ElasticSan/elasticSans/volumeGroups","Microsoft.HDInsight/clusters",
  "Microsoft.Kusto/clusters","Microsoft.Kusto/clusters/databases","Microsoft.PowerBI/dedicatedCapacities",
  "Microsoft.Purview/accounts","Microsoft.Sql/managedInstances","Microsoft.Sql/managedInstances/databases",
  "Microsoft.Sql/servers","Microsoft.Sql/servers/databases","Microsoft.Sql/servers/elasticPools",
  "Microsoft.StreamAnalytics/streamingjobs","Microsoft.Synapse/workspaces","Microsoft.Synapse/workspaces/bigDataPools",
  "Microsoft.Synapse/workspaces/sqlPools","Microsoft.ApiManagement/service","Microsoft.ApiManagement/service/apis",
  "Microsoft.ApiManagement/service/products","Microsoft.ApiManagement/service/subscriptions",
  "Microsoft.Communication/communicationServices","Microsoft.EventGrid/domains","Microsoft.EventGrid/eventSubscriptions",
  "Microsoft.EventGrid/systemTopics","Microsoft.EventGrid/topics","Microsoft.EventHub/namespaces",
  "Microsoft.EventHub/namespaces/eventhubs","Microsoft.Logic/integrationAccounts","Microsoft.Logic/workflows",
  "Microsoft.NotificationHubs/namespaces","Microsoft.NotificationHubs/namespaces/notificationHubs","Microsoft.Relay/namespaces",
  "Microsoft.Relay/namespaces/hybridConnections","Microsoft.ServiceBus/namespaces","Microsoft.ServiceBus/namespaces/queues",
  "Microsoft.ServiceBus/namespaces/topics","Microsoft.ServiceBus/namespaces/topics/subscriptions",
  "Microsoft.SignalRService/signalR","Microsoft.SignalRService/webPubSub","Microsoft.AppConfiguration/configurationStores",
  "Microsoft.Automation/automationAccounts","Microsoft.Automation/automationAccounts/runbooks",
  "Microsoft.Automation/automationAccounts/schedules","Microsoft.Chaos/experiments","Microsoft.Dashboard/grafana",
  "Microsoft.DevCenter/devcenters","Microsoft.DevCenter/projects","Microsoft.DevTestLab/labs",
  "Microsoft.DevTestLab/labs/virtualMachines","Microsoft.Insights/actionGroups","Microsoft.Insights/autoscaleSettings",
  "Microsoft.Insights/components","Microsoft.Insights/dataCollectionEndpoints","Microsoft.Insights/dataCollectionRules",
  "Microsoft.Insights/diagnosticSettings","Microsoft.Insights/metricAlerts","Microsoft.Insights/scheduledQueryRules",
  "Microsoft.LoadTestService/loadTests","Microsoft.Maintenance/maintenanceConfigurations",
  "Microsoft.OperationalInsights/workspaces","Microsoft.TestBase/testBaseAccounts","Microsoft.BotService/botServices",
  "Microsoft.CognitiveServices/accounts","Microsoft.CognitiveServices/accounts/deployments",
  "Microsoft.CognitiveServices/accounts/raiPolicies","Microsoft.HealthcareApis/workspaces",
  "Microsoft.HealthcareApis/workspaces/dicomservices","Microsoft.HealthcareApis/workspaces/fhirservices",
  "Microsoft.MachineLearningServices/workspaces","Microsoft.MachineLearningServices/workspaces/batchEndpoints",
  "Microsoft.MachineLearningServices/workspaces/computes","Microsoft.MachineLearningServices/workspaces/datastores",
  "Microsoft.MachineLearningServices/workspaces/onlineEndpoints","Microsoft.MachineLearningServices/workspaces/onlineEndpoints/deployments",
  "Microsoft.Search/searchServices","Microsoft.Devices/IotHubs","Microsoft.DigitalTwins/digitalTwinsInstances",
  "Microsoft.HybridCompute/machines","Microsoft.HybridCompute/machines/extensions","Microsoft.IoTHub/IoTHubs",
  "Microsoft.IoTHub/provisioningServices","Microsoft.Kubernetes/connectedClusters","Microsoft.KubernetesConfiguration/extensions",
  "Microsoft.KubernetesConfiguration/fluxConfigurations","Microsoft.Media/mediaservices","Microsoft.MixedReality/remoteRenderingAccounts",
  "Microsoft.Orbital/spacecrafts","Microsoft.Quantum/workspaces","Microsoft.TimeSeriesInsights/environments"
];

function parseAwsSchema(cfnSpec) {
    const resources = {};
    const types = Object.keys(cfnSpec.ResourceTypes);
    console.log(`[AWS] Parsing ${types.length} resource types...`);
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

async function main() {
    if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

    // 1. Parse the downloaded AWS file
    console.log('Loading AWS CloudFormation Specification from local file...');
    const awsRaw = fs.readFileSync(AWS_LOCAL_FILE, 'utf8');
    const awsResources = parseAwsSchema(JSON.parse(awsRaw));

    // 2. Inject Azure list
    const azureParsed = {};
    azureResources.forEach(type => {
        azureParsed[type] = { typeName: type, provider: 'azure', properties: {}, required: [] };
    });

    // 3. Merge and Save
    const db = {
        updatedAt: new Date().toISOString(),
        count: Object.keys(awsResources).length + Object.keys(azureParsed).length,
        resources: { ...awsResources, ...azureParsed }
    };
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(db, null, 2));
    console.log(`\nSuccess! Saved ${db.count} resources to ${OUTPUT_FILE}`);
}

main().catch(err => console.error('Failed:', err.message));