terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-app-managedenvironment" {
  source  = "Azure/avm-res-app-managedenvironment/azurerm"
  version = "0.5.0"

  {{#location}}location                                     = {{{location}}}{{/location}}
  {{#name}}name                                         = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                          = {{{resource_group_name}}}{{/resource_group_name}}
  {{#app_insights_configuration}}app_insights_configuration                   = {{{app_insights_configuration}}}{{/app_insights_configuration}}
  {{#app_logs_configuration}}app_logs_configuration                       = {{{app_logs_configuration}}}{{/app_logs_configuration}}
  {{#availability_zones}}availability_zones                           = {{{availability_zones}}}{{/availability_zones}}
  {{#certificate_password}}certificate_password                         = {{{certificate_password}}}{{/certificate_password}}
  {{#certificate_password_version}}certificate_password_version                 = {{{certificate_password_version}}}{{/certificate_password_version}}
  {{#certificate_value}}certificate_value                            = {{{certificate_value}}}{{/certificate_value}}
  {{#certificate_value_version}}certificate_value_version                    = {{{certificate_value_version}}}{{/certificate_value_version}}
  {{#certificates}}certificates                                 = {{{certificates}}}{{/certificates}}
  {{#connection_string}}connection_string                            = {{{connection_string}}}{{/connection_string}}
  {{#connection_string_version}}connection_string_version                    = {{{connection_string_version}}}{{/connection_string_version}}
  {{#custom_domain_certificate_key_vault_identity}}custom_domain_certificate_key_vault_identity = {{{custom_domain_certificate_key_vault_identity}}}{{/custom_domain_certificate_key_vault_identity}}
  {{#custom_domain_certificate_key_vault_url}}custom_domain_certificate_key_vault_url      = {{{custom_domain_certificate_key_vault_url}}}{{/custom_domain_certificate_key_vault_url}}
  {{#custom_domain_certificate_password}}custom_domain_certificate_password           = {{{custom_domain_certificate_password}}}{{/custom_domain_certificate_password}}
  {{#custom_domain_certificate_value}}custom_domain_certificate_value              = {{{custom_domain_certificate_value}}}{{/custom_domain_certificate_value}}
  {{#custom_domain_configuration}}custom_domain_configuration                  = {{{custom_domain_configuration}}}{{/custom_domain_configuration}}
  {{#custom_domain_dns_suffix}}custom_domain_dns_suffix                     = {{{custom_domain_dns_suffix}}}{{/custom_domain_dns_suffix}}
  {{#dapr_ai_connection_string}}dapr_ai_connection_string                    = {{{dapr_ai_connection_string}}}{{/dapr_ai_connection_string}}
  {{#dapr_ai_connection_string_version}}dapr_ai_connection_string_version            = {{{dapr_ai_connection_string_version}}}{{/dapr_ai_connection_string_version}}
  {{#dapr_ai_instrumentation_key}}dapr_ai_instrumentation_key                  = {{{dapr_ai_instrumentation_key}}}{{/dapr_ai_instrumentation_key}}
  {{#dapr_ai_instrumentation_key_version}}dapr_ai_instrumentation_key_version          = {{{dapr_ai_instrumentation_key_version}}}{{/dapr_ai_instrumentation_key_version}}
  {{#dapr_application_insights_connection_string}}dapr_application_insights_connection_string  = {{{dapr_application_insights_connection_string}}}{{/dapr_application_insights_connection_string}}
  {{#dapr_components}}dapr_components                              = {{{dapr_components}}}{{/dapr_components}}
  {{#dapr_configuration}}dapr_configuration                           = {{{dapr_configuration}}}{{/dapr_configuration}}
  {{#dapr_subscriptions}}dapr_subscriptions                           = {{{dapr_subscriptions}}}{{/dapr_subscriptions}}
  {{#diagnostic_settings}}diagnostic_settings                          = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#disk_encryption_configuration}}disk_encryption_configuration                = {{{disk_encryption_configuration}}}{{/disk_encryption_configuration}}
  {{#dot_net_components}}dot_net_components                           = {{{dot_net_components}}}{{/dot_net_components}}
  {{#enable_telemetry}}enable_telemetry                             = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#http_route_configs}}http_route_configs                           = {{{http_route_configs}}}{{/http_route_configs}}
  {{#infrastructure_resource_group}}infrastructure_resource_group                = {{{infrastructure_resource_group}}}{{/infrastructure_resource_group}}
  {{#infrastructure_resource_group_name}}infrastructure_resource_group_name           = {{{infrastructure_resource_group_name}}}{{/infrastructure_resource_group_name}}
  {{#infrastructure_subnet_id}}infrastructure_subnet_id                     = {{{infrastructure_subnet_id}}}{{/infrastructure_subnet_id}}
  {{#ingress_configuration}}ingress_configuration                        = {{{ingress_configuration}}}{{/ingress_configuration}}
  {{#internal_load_balancer_enabled}}internal_load_balancer_enabled               = {{{internal_load_balancer_enabled}}}{{/internal_load_balancer_enabled}}
  {{#java_components}}java_components                              = {{{java_components}}}{{/java_components}}
  {{#keda_configuration}}keda_configuration                           = {{{keda_configuration}}}{{/keda_configuration}}
  {{#key}}key                                          = {{{key}}}{{/key}}
  {{#key_version}}key_version                                  = {{{key_version}}}{{/key_version}}
  {{#kind}}kind                                         = {{{kind}}}{{/kind}}
  {{#lock}}lock                                         = {{{lock}}}{{/lock}}
  {{#log_analytics_workspace}}log_analytics_workspace                      = {{{log_analytics_workspace}}}{{/log_analytics_workspace}}
  {{#log_analytics_workspace_customer_id}}log_analytics_workspace_customer_id          = {{{log_analytics_workspace_customer_id}}}{{/log_analytics_workspace_customer_id}}
  {{#log_analytics_workspace_destination}}log_analytics_workspace_destination          = {{{log_analytics_workspace_destination}}}{{/log_analytics_workspace_destination}}
  {{#log_analytics_workspace_primary_shared_key}}log_analytics_workspace_primary_shared_key   = {{{log_analytics_workspace_primary_shared_key}}}{{/log_analytics_workspace_primary_shared_key}}
  {{#maintenance_configurations}}maintenance_configurations                   = {{{maintenance_configurations}}}{{/maintenance_configurations}}
  {{#managed_certificates}}managed_certificates                         = {{{managed_certificates}}}{{/managed_certificates}}
  {{#managed_identities}}managed_identities                           = {{{managed_identities}}}{{/managed_identities}}
  {{#open_telemetry_configuration}}open_telemetry_configuration                 = {{{open_telemetry_configuration}}}{{/open_telemetry_configuration}}
  {{#parent_id}}parent_id                                    = {{{parent_id}}}{{/parent_id}}
  {{#peer_authentication}}peer_authentication                          = {{{peer_authentication}}}{{/peer_authentication}}
  {{#peer_authentication_enabled}}peer_authentication_enabled                  = {{{peer_authentication_enabled}}}{{/peer_authentication_enabled}}
  {{#peer_traffic_configuration}}peer_traffic_configuration                   = {{{peer_traffic_configuration}}}{{/peer_traffic_configuration}}
  {{#peer_traffic_encryption_enabled}}peer_traffic_encryption_enabled              = {{{peer_traffic_encryption_enabled}}}{{/peer_traffic_encryption_enabled}}
  {{#public_network_access}}public_network_access                        = {{{public_network_access}}}{{/public_network_access}}
  {{#public_network_access_enabled}}public_network_access_enabled                = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                             = {{{role_assignments}}}{{/role_assignments}}
  {{#shared_key}}shared_key                                   = {{{shared_key}}}{{/shared_key}}
  {{#shared_key_version}}shared_key_version                           = {{{shared_key_version}}}{{/shared_key_version}}
  {{#storages}}storages                                     = {{{storages}}}{{/storages}}
  {{#tags}}tags                                         = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                     = {{{timeouts}}}{{/timeouts}}
  {{#vnet_configuration}}vnet_configuration                           = {{{vnet_configuration}}}{{/vnet_configuration}}
  {{#workload_profile}}workload_profile                             = {{{workload_profile}}}{{/workload_profile}}
  {{#workload_profiles}}workload_profiles                            = {{{workload_profiles}}}{{/workload_profiles}}
  {{#zone_redundancy_enabled}}zone_redundancy_enabled                      = {{{zone_redundancy_enabled}}}{{/zone_redundancy_enabled}}
  {{#zone_redundant}}zone_redundant                               = {{{zone_redundant}}}{{/zone_redundant}}
}
