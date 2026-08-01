const fs = require('fs');
const path = require('path');

// ==============================================================================
// ARCHITECTURAL CONFIGURATION
// ==============================================================================
const BASE_DIR = path.join(__dirname, '..');
const SCHEMAS_DIR = path.join(BASE_DIR, 'backend', 'schemas', 'aws');
const TEMPLATES_DIR = path.join(BASE_DIR, 'backend', 'templates', 'aws');
const OVERRIDES_FILE = path.join(BASE_DIR, 'db', 'terraform_module_overrides.json');

if (!fs.existsSync(SCHEMAS_DIR)) fs.mkdirSync(SCHEMAS_DIR, { recursive: true });
if (!fs.existsSync(TEMPLATES_DIR)) fs.mkdirSync(TEMPLATES_DIR, { recursive: true });

// ==============================================================================
// COMPLETE AWS CATALOG (159 Unique Resources - Expanded from Matrix)
// ==============================================================================
const awsCatalog = [
  // Identity and Access (13)
  { cfType: "AWS::IAM::Role", tfType: "aws_iam_role" },
  { cfType: "AWS::IAM::ManagedPolicy", tfType: "aws_iam_policy" },
  { cfType: "AWS::IAM::User", tfType: "aws_iam_user" },
  { cfType: "AWS::IAM::Group", tfType: "aws_iam_group" },
  { cfType: "AWS::IAM::InstanceProfile", tfType: "aws_iam_instance_profile" },
  { cfType: "AWS::SSO::PermissionSet", tfType: "aws_ssoadmin_permission_set" },
  { cfType: "AWS::SSO::Assignment", tfType: "aws_ssoadmin_account_assignment" },
  { cfType: "AWS::SSO::CustomerManagedPolicyAttachment", tfType: "aws_ssoadmin_customer_managed_policy_attachment" },
  { cfType: "AWS::Organizations::Organization", tfType: "aws_organizations_organization" },
  { cfType: "AWS::Organizations::OrganizationalUnit", tfType: "aws_organizations_organizational_unit" },
  { cfType: "AWS::Organizations::Account", tfType: "aws_organizations_account" },
  { cfType: "AWS::Organizations::Policy", tfType: "aws_organizations_policy" },
  { cfType: "AWS::Organizations::PolicyAttachment", tfType: "aws_organizations_policy_attachment" },

  // Security (25)
  { cfType: "AWS::KMS::Key", tfType: "aws_kms_key" },
  { cfType: "AWS::KMS::Alias", tfType: "aws_kms_alias" },
  { cfType: "AWS::KMS::ReplicaKey", tfType: "aws_kms_replica_key" },
  { cfType: "AWS::SecretsManager::Secret", tfType: "aws_secretsmanager_secret" },
  { cfType: "AWS::SecretsManager::RotationSchedule", tfType: "aws_secretsmanager_secret_rotation" },
  { cfType: "AWS::CertificateManager::Certificate", tfType: "aws_acm_certificate" },
  { cfType: "AWS::WAFv2::WebACL", tfType: "aws_wafv2_web_acl" },
  { cfType: "AWS::WAFv2::RuleGroup", tfType: "aws_wafv2_rule_group" },
  { cfType: "AWS::WAFv2::IPSet", tfType: "aws_wafv2_ip_set" },
  { cfType: "AWS::Shield::Protection", tfType: "aws_shield_protection" },
  { cfType: "AWS::Shield::ProtectionGroup", tfType: "aws_shield_protection_group" },
  { cfType: "AWS::GuardDuty::Detector", tfType: "aws_guardduty_detector" },
  { cfType: "AWS::GuardDuty::OrganizationConfiguration", tfType: "aws_guardduty_organization_configuration" },
  { cfType: "AWS::GuardDuty::ThreatIntelSet", tfType: "aws_guardduty_threatintelset" },
  { cfType: "AWS::SecurityHub::Hub", tfType: "aws_securityhub_account" },
  { cfType: "AWS::SecurityHub::Standard", tfType: "aws_securityhub_standards_subscription" },
  { cfType: "AWS::SecurityHub::AutomationRule", tfType: "aws_securityhub_automation_rule" },
  { cfType: "AWS::InspectorV2::Enabler", tfType: "aws_inspector2_enabler" },
  { cfType: "AWS::InspectorV2::OrganizationConfiguration", tfType: "aws_inspector2_organization_configuration" },
  { cfType: "AWS::Macie::Session", tfType: "aws_macie2_account" },
  { cfType: "AWS::Macie::AllowList", tfType: "aws_macie2_classification_job" },
  { cfType: "AWS::NetworkFirewall::Firewall", tfType: "aws_networkfirewall_firewall" },
  { cfType: "AWS::NetworkFirewall::FirewallPolicy", tfType: "aws_networkfirewall_firewall_policy" },
  { cfType: "AWS::NetworkFirewall::RuleGroup", tfType: "aws_networkfirewall_rule_group" },
  { cfType: "AWS::FMS::Policy", tfType: "aws_fms_policy" },
  { cfType: "AWS::AuditManager::Assessment", tfType: "aws_auditmanager_assessment" },
  { cfType: "AWS::AuditManager::AssessmentFramework", tfType: "aws_auditmanager_assessment_framework" },

  // Governance (8)
  { cfType: "AWS::Config::ConfigurationRecorder", tfType: "aws_config_configuration_recorder" },
  { cfType: "AWS::Config::DeliveryChannel", tfType: "aws_config_delivery_channel" },
  { cfType: "AWS::Config::ConfigRule", tfType: "aws_config_config_rule" },
  { cfType: "AWS::Config::ConformancePack", tfType: "aws_config_conformance_pack" },
  { cfType: "AWS::ControlTower::LandingZone", tfType: "aws_controltower_landing_zone" },
  { cfType: "AWS::ControlTower::EnabledControl", tfType: "aws_controltower_control" },
  { cfType: "AWS::ServiceCatalog::Portfolio", tfType: "aws_servicecatalog_portfolio" },
  { cfType: "AWS::ServiceCatalog::CloudFormationProduct", tfType: "aws_servicecatalog_product" },

  // Networking (24)
  { cfType: "AWS::EC2::VPC", tfType: "aws_vpc" },
  { cfType: "AWS::EC2::Subnet", tfType: "aws_subnet" },
  { cfType: "AWS::EC2::RouteTable", tfType: "aws_route_table" },
  { cfType: "AWS::EC2::Route", tfType: "aws_route" },
  { cfType: "AWS::EC2::InternetGateway", tfType: "aws_internet_gateway" },
  { cfType: "AWS::EC2::NatGateway", tfType: "aws_nat_gateway" },
  { cfType: "AWS::EC2::SecurityGroup", tfType: "aws_security_group" },
  { cfType: "AWS::EC2::NetworkAcl", tfType: "aws_network_acl" },
  { cfType: "AWS::EC2::VPCEndpoint", tfType: "aws_vpc_endpoint" },
  { cfType: "AWS::EC2::VPCPeeringConnection", tfType: "aws_vpc_peering_connection" },
  { cfType: "AWS::EC2::TransitGateway", tfType: "aws_ec2_transit_gateway" },
  { cfType: "AWS::EC2::TransitGatewayVpcAttachment", tfType: "aws_ec2_transit_gateway_vpc_attachment" },
  { cfType: "AWS::NetworkManager::CoreNetwork", tfType: "aws_networkmanager_core_network" },
  { cfType: "AWS::DirectConnect::PrivateVirtualInterface", tfType: "aws_dx_private_virtual_interface" },
  { cfType: "AWS::DirectConnect::TransitVirtualInterface", tfType: "aws_dx_transit_virtual_interface" },
  { cfType: "AWS::EC2::CustomerGateway", tfType: "aws_customer_gateway" },
  { cfType: "AWS::EC2::VPNConnection", tfType: "aws_vpn_connection" },
  { cfType: "AWS::ElasticLoadBalancingV2::LoadBalancer", tfType: "aws_lb" },
  { cfType: "AWS::ElasticLoadBalancingV2::Listener", tfType: "aws_lb_listener" },
  { cfType: "AWS::ElasticLoadBalancingV2::TargetGroup", tfType: "aws_lb_target_group" },
  { cfType: "AWS::Route53::HostedZone", tfType: "aws_route53_zone" },
  { cfType: "AWS::Route53::RecordSet", tfType: "aws_route53_record" },
  { cfType: "AWS::Route53Resolver::ResolverEndpoint", tfType: "aws_route53_resolver_endpoint" },
  { cfType: "AWS::CloudFront::Distribution", tfType: "aws_cloudfront_distribution" },
  { cfType: "AWS::GlobalAccelerator::Accelerator", tfType: "aws_globalaccelerator_accelerator" },
  { cfType: "AWS::EC2::VPCEndpointService", tfType: "aws_vpc_endpoint_service" },

  // Compute (7)
  { cfType: "AWS::EC2::Instance", tfType: "aws_instance" },
  { cfType: "AWS::EC2::LaunchTemplate", tfType: "aws_launch_template" },
  { cfType: "AWS::AutoScaling::AutoScalingGroup", tfType: "aws_autoscaling_group" },
  { cfType: "AWS::AutoScaling::ScalingPolicy", tfType: "aws_autoscaling_policy" },
  { cfType: "AWS::SSM::Parameter", tfType: "aws_ssm_parameter" },
  { cfType: "AWS::SSM::Association", tfType: "aws_ssm_association" },
  { cfType: "AWS::SSM::MaintenanceWindow", tfType: "aws_ssm_maintenance_window" },

  // Containers (9)
  { cfType: "AWS::ECS::Cluster", tfType: "aws_ecs_cluster" },
  { cfType: "AWS::ECS::TaskDefinition", tfType: "aws_ecs_task_definition" },
  { cfType: "AWS::ECS::Service", tfType: "aws_ecs_service" },
  { cfType: "AWS::ECR::Repository", tfType: "aws_ecr_repository" },
  { cfType: "AWS::ECR::LifecyclePolicy", tfType: "aws_ecr_lifecycle_policy" },
  { cfType: "AWS::EKS::Cluster", tfType: "aws_eks_cluster" },
  { cfType: "AWS::EKS::Nodegroup", tfType: "aws_eks_node_group" },
  { cfType: "AWS::EKS::Addon", tfType: "aws_eks_addon" },
  { cfType: "AWS::AppRunner::Service", tfType: "aws_apprunner_service" },

  // Serverless (5)
  { cfType: "AWS::Lambda::Function", tfType: "aws_lambda_function" },
  { cfType: "AWS::Lambda::LayerVersion", tfType: "aws_lambda_layer_version" },
  { cfType: "AWS::Lambda::EventSourceMapping", tfType: "aws_lambda_event_source_mapping" },
  { cfType: "AWS::ApiGateway::RestApi", tfType: "aws_api_gateway_rest_api" },
  { cfType: "AWS::ApiGatewayV2::Api", tfType: "aws_apigatewayv2_api" },

  // Integration (8)
  { cfType: "AWS::Events::EventBus", tfType: "aws_cloudwatch_event_bus" },
  { cfType: "AWS::Events::Rule", tfType: "aws_cloudwatch_event_rule" },
  { cfType: "AWS::Scheduler::Schedule", tfType: "aws_scheduler_schedule" },
  { cfType: "AWS::SNS::Topic", tfType: "aws_sns_topic" },
  { cfType: "AWS::SNS::Subscription", tfType: "aws_sns_topic_subscription" },
  { cfType: "AWS::SQS::Queue", tfType: "aws_sqs_queue" },
  { cfType: "AWS::StepFunctions::StateMachine", tfType: "aws_sfn_state_machine" },
  { cfType: "AWS::MWAA::Environment", tfType: "aws_mwaa_environment" },

  // Storage (16)
  { cfType: "AWS::S3::Bucket", tfType: "aws_s3_bucket" },
  { cfType: "AWS::S3::BucketVersioning", tfType: "aws_s3_bucket_versioning" },
  { cfType: "AWS::S3::BucketEncryption", tfType: "aws_s3_bucket_server_side_encryption_configuration" },
  { cfType: "AWS::S3::BucketPolicy", tfType: "aws_s3_bucket_policy" },
  { cfType: "AWS::S3::AccessPoint", tfType: "aws_s3_access_point" },
  { cfType: "AWS::EC2::Volume", tfType: "aws_ebs_volume" },
  { cfType: "AWS::EFS::FileSystem", tfType: "aws_efs_file_system" },
  { cfType: "AWS::FSx::LustreFileSystem", tfType: "aws_fsx_lustre_file_system" },
  { cfType: "AWS::FSx::WindowsFileSystem", tfType: "aws_fsx_windows_file_system" },
  { cfType: "AWS::FSx::OntapFileSystem", tfType: "aws_fsx_ontap_file_system" },
  { cfType: "AWS::FSx::OpenZFSFileSystem", tfType: "aws_fsx_openzfs_file_system" },
  { cfType: "AWS::Backup::BackupVault", tfType: "aws_backup_vault" },
  { cfType: "AWS::Backup::BackupPlan", tfType: "aws_backup_plan" },
  { cfType: "AWS::Backup::BackupSelection", tfType: "aws_backup_selection" },
  { cfType: "AWS::StorageGateway::NFSFileShare", tfType: "aws_storagegateway_nfs_file_share" },
  { cfType: "AWS::StorageGateway::SMBFileShare", tfType: "aws_storagegateway_smb_file_share" },

  // Databases (11)
  { cfType: "AWS::RDS::DBInstance", tfType: "aws_db_instance" },
  { cfType: "AWS::RDS::DBCluster", tfType: "aws_rds_cluster" },
  { cfType: "AWS::RDS::DBSubnetGroup", tfType: "aws_db_subnet_group" },
  { cfType: "AWS::RDS::DBParameterGroup", tfType: "aws_db_parameter_group" },
  { cfType: "AWS::DynamoDB::Table", tfType: "aws_dynamodb_table" },
  { cfType: "AWS::DynamoDB::GlobalTable", tfType: "aws_dynamodb_global_table" },
  { cfType: "AWS::ElastiCache::ReplicationGroup", tfType: "aws_elasticache_replication_group" },
  { cfType: "AWS::OpenSearchService::Domain", tfType: "aws_opensearch_domain" },
  { cfType: "AWS::Redshift::Cluster", tfType: "aws_redshift_cluster" },
  { cfType: "AWS::RedshiftServerless::Namespace", tfType: "aws_redshiftserverless_namespace" },
  { cfType: "AWS::RedshiftServerless::Workgroup", tfType: "aws_redshiftserverless_workgroup" },

  // Analytics (11)
  { cfType: "AWS::Glue::Database", tfType: "aws_glue_catalog_database" },
  { cfType: "AWS::Glue::Crawler", tfType: "aws_glue_crawler" },
  { cfType: "AWS::Glue::Job", tfType: "aws_glue_job" },
  { cfType: "AWS::Athena::WorkGroup", tfType: "aws_athena_workgroup" },
  { cfType: "AWS::Kinesis::Stream", tfType: "aws_kinesis_stream" },
  { cfType: "AWS::KinesisFirehose::DeliveryStream", tfType: "aws_kinesis_firehose_delivery_stream" },
  { cfType: "AWS::MSK::Cluster", tfType: "aws_msk_cluster" },
  { cfType: "AWS::QuickSight::DataSource", tfType: "aws_quicksight_data_source" },
  { cfType: "AWS::QuickSight::Dashboard", tfType: "aws_quicksight_dashboard" },
  { cfType: "AWS::LakeFormation::DataLakeSettings", tfType: "aws_lakeformation_data_lake_settings" },
  { cfType: "AWS::LakeFormation::Permissions", tfType: "aws_lakeformation_permissions" },

  // Observability (5)
  { cfType: "AWS::Logs::LogGroup", tfType: "aws_cloudwatch_log_group" },
  { cfType: "AWS::CloudWatch::Alarm", tfType: "aws_cloudwatch_metric_alarm" },
  { cfType: "AWS::CloudWatch::Dashboard", tfType: "aws_cloudwatch_dashboard" },
  { cfType: "AWS::CloudTrail::Trail", tfType: "aws_cloudtrail" },
  { cfType: "AWS::XRay::SamplingRule", tfType: "aws_xray_sampling_rule" },

  // Developer Tools (4)
  { cfType: "AWS::CodeBuild::Project", tfType: "aws_codebuild_project" },
  { cfType: "AWS::CodePipeline::Pipeline", tfType: "aws_codepipeline" },
  { cfType: "AWS::CodeArtifact::Domain", tfType: "aws_codeartifact_domain" },
  { cfType: "AWS::CodeConnections::Connection", tfType: "aws_codestarconnections_connection" },

  // Management (3)
  { cfType: "AWS::ResourceGroups::Group", tfType: "aws_resourcegroups_group" },
  { cfType: "AWS::ResourceExplorer2::Index", tfType: "aws_resourceexplorer2_index" },
  { cfType: "AWS::ResourceExplorer2::View", tfType: "aws_resourceexplorer2_view" },

  // AI and Machine Learning (10)
  { cfType: "AWS::SageMaker::Domain", tfType: "aws_sagemaker_domain" },
  { cfType: "AWS::SageMaker::NotebookInstance", tfType: "aws_sagemaker_notebook_instance" },
  { cfType: "AWS::SageMaker::Model", tfType: "aws_sagemaker_model" },
  { cfType: "AWS::SageMaker::EndpointConfig", tfType: "aws_sagemaker_endpoint_configuration" },
  { cfType: "AWS::SageMaker::Endpoint", tfType: "aws_sagemaker_endpoint" },
  { cfType: "AWS::Bedrock::KnowledgeBase", tfType: "aws_bedrockagent_knowledge_base" },
  { cfType: "AWS::Bedrock::Agent", tfType: "aws_bedrockagent_agent" },
  { cfType: "AWS::Bedrock::Guardrail", tfType: "aws_bedrock_guardrail" },
  { cfType: "AWS::Bedrock::ModelInvocationLoggingConfiguration", tfType: "aws_bedrock_model_invocation_logging_configuration" },
  { cfType: "AWS::QBusiness::Application", tfType: "aws_qbusiness_application" }
];

// ==============================================================================
// GENERATORS
// ==============================================================================
function generateSchema(cfType) {
  return {
    "type": "object",
    "properties": {
      "id": { "type": "string", "title": "Logical ID", "description": `Logical ID for ${cfType}` },
      "properties": { "type": "object", "title": "Resource Properties", "description": "CloudFormation properties mapped directly to Terraform arguments" }
    },
    "required": ["id"]
  };
}

function generateHcl(tfType) {
  return `terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "${tfType}" "this" {
  # Properties injected dynamically by IaC-Generator-v2 backend
}
`;
}

// ==============================================================================
// EXECUTION
// ==============================================================================
function run() {
  console.log(`[AWS Factory] Starting generation for ${awsCatalog.length} raw AWS resources...`);
  
  let existingOverrides = {};
  if (fs.existsSync(OVERRIDES_FILE)) {
    const raw = fs.readFileSync(OVERRIDES_FILE, 'utf8').replace(/^\uFEFF/, '');
    existingOverrides = JSON.parse(raw);
  }

  let generatedCount = 0;

  awsCatalog.forEach(item => {
    const safeFileName = item.cfType.replace(/::/g, '_').replace(/\//g, '_');
    const schemaFileName = `${safeFileName}.schema.json`;
    const hclFileName = `${safeFileName}.hcl`;

    fs.writeFileSync(path.join(SCHEMAS_DIR, schemaFileName), JSON.stringify(generateSchema(item.cfType), null, 2), 'utf8');
    fs.writeFileSync(path.join(TEMPLATES_DIR, hclFileName), generateHcl(item.tfType), 'utf8');

    existingOverrides[item.cfType] = {
      type: "resource",
      tfResourceType: item.tfType,
      schemaFile: schemaFileName,
      hclTemplate: hclFileName
    };

    generatedCount++;
  });

  fs.writeFileSync(OVERRIDES_FILE, JSON.stringify(existingOverrides, null, 2), 'utf8');

  console.log(`[AWS Factory] Success!`);
  console.log(` -> Generated: ${generatedCount} AWS resources.`);
  console.log(` -> Merged into: ${OVERRIDES_FILE}`);
}

run();