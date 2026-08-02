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

  {{#if location}}location                                     = {{hclVal location}}{{/if}}
  {{#if name}}name                                         = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                          = {{hclVal resource_group_name}}{{/if}}
  {{#if app_insights_configuration}}app_insights_configuration                   = {{hclVal app_insights_configuration}}{{/if}}
  {{#if app_logs_configuration}}app_logs_configuration                       = {{hclVal app_logs_configuration}}{{/if}}
  {{#if availability_zones}}availability_zones                           = {{hclVal availability_zones}}{{/if}}
  {{#if certificate_password}}certificate_password                         = {{hclVal certificate_password}}{{/if}}
  {{#if certificate_password_version}}certificate_password_version                 = {{hclVal certificate_password_version}}{{/if}}
  {{#if certificate_value}}certificate_value                            = {{hclVal certificate_value}}{{/if}}
  {{#if certificate_value_version}}certificate_value_version                    = {{hclVal certificate_value_version}}{{/if}}
  {{#if certificates}}certificates                                 = {{hclVal certificates}}{{/if}}
  {{#if connection_string}}connection_string                            = {{hclVal connection_string}}{{/if}}
  {{#if connection_string_version}}connection_string_version                    = {{hclVal connection_string_version}}{{/if}}
  {{#if custom_domain_certificate_key_vault_identity}}custom_domain_certificate_key_vault_identity = {{hclVal custom_domain_certificate_key_vault_identity}}{{/if}}
  {{#if custom_domain_certificate_key_vault_url}}custom_domain_certificate_key_vault_url      = {{hclVal custom_domain_certificate_key_vault_url}}{{/if}}
  {{#if custom_domain_certificate_password}}custom_domain_certificate_password           = {{hclVal custom_domain_certificate_password}}{{/if}}
  {{#if custom_domain_certificate_value}}custom_domain_certificate_value              = {{hclVal custom_domain_certificate_value}}{{/if}}
  {{#if custom_domain_configuration}}custom_domain_configuration                  = {{hclVal custom_domain_configuration}}{{/if}}
  {{#if custom_domain_dns_suffix}}custom_domain_dns_suffix                     = {{hclVal custom_domain_dns_suffix}}{{/if}}
  {{#if dapr_ai_connection_string}}dapr_ai_connection_string                    = {{hclVal dapr_ai_connection_string}}{{/if}}
  {{#if dapr_ai_connection_string_version}}dapr_ai_connection_string_version            = {{hclVal dapr_ai_connection_string_version}}{{/if}}
  {{#if dapr_ai_instrumentation_key}}dapr_ai_instrumentation_key                  = {{hclVal dapr_ai_instrumentation_key}}{{/if}}
  {{#if dapr_ai_instrumentation_key_version}}dapr_ai_instrumentation_key_version          = {{hclVal dapr_ai_instrumentation_key_version}}{{/if}}
  {{#if dapr_application_insights_connection_string}}dapr_application_insights_connection_string  = {{hclVal dapr_application_insights_connection_string}}{{/if}}
  {{#if dapr_components}}dapr_components                              = {{hclVal dapr_components}}{{/if}}
  {{#if dapr_configuration}}dapr_configuration                           = {{hclVal dapr_configuration}}{{/if}}
  {{#if dapr_subscriptions}}dapr_subscriptions                           = {{hclVal dapr_subscriptions}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                          = {{hclVal diagnostic_settings}}{{/if}}
  {{#if disk_encryption_configuration}}disk_encryption_configuration                = {{hclVal disk_encryption_configuration}}{{/if}}
  {{#if dot_net_components}}dot_net_components                           = {{hclVal dot_net_components}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                             = {{hclVal enable_telemetry}}{{/if}}
  {{#if http_route_configs}}http_route_configs                           = {{hclVal http_route_configs}}{{/if}}
  {{#if infrastructure_resource_group}}infrastructure_resource_group                = {{hclVal infrastructure_resource_group}}{{/if}}
  {{#if infrastructure_resource_group_name}}infrastructure_resource_group_name           = {{hclVal infrastructure_resource_group_name}}{{/if}}
  {{#if infrastructure_subnet_id}}infrastructure_subnet_id                     = {{hclVal infrastructure_subnet_id}}{{/if}}
  {{#if ingress_configuration}}ingress_configuration                        = {{hclVal ingress_configuration}}{{/if}}
  {{#if internal_load_balancer_enabled}}internal_load_balancer_enabled               = {{hclVal internal_load_balancer_enabled}}{{/if}}
  {{#if java_components}}java_components                              = {{hclVal java_components}}{{/if}}
  {{#if keda_configuration}}keda_configuration                           = {{hclVal keda_configuration}}{{/if}}
  {{#if key}}key                                          = {{hclVal key}}{{/if}}
  {{#if key_version}}key_version                                  = {{hclVal key_version}}{{/if}}
  {{#if kind}}kind                                         = {{hclVal kind}}{{/if}}
  {{#if lock}}lock                                         = {{hclVal lock}}{{/if}}
  {{#if log_analytics_workspace}}log_analytics_workspace                      = {{hclVal log_analytics_workspace}}{{/if}}
  {{#if log_analytics_workspace_customer_id}}log_analytics_workspace_customer_id          = {{hclVal log_analytics_workspace_customer_id}}{{/if}}
  {{#if log_analytics_workspace_destination}}log_analytics_workspace_destination          = {{hclVal log_analytics_workspace_destination}}{{/if}}
  {{#if log_analytics_workspace_primary_shared_key}}log_analytics_workspace_primary_shared_key   = {{hclVal log_analytics_workspace_primary_shared_key}}{{/if}}
  {{#if maintenance_configurations}}maintenance_configurations                   = {{hclVal maintenance_configurations}}{{/if}}
  {{#if managed_certificates}}managed_certificates                         = {{hclVal managed_certificates}}{{/if}}
  {{#if managed_identities}}managed_identities                           = {{hclVal managed_identities}}{{/if}}
  {{#if open_telemetry_configuration}}open_telemetry_configuration                 = {{hclVal open_telemetry_configuration}}{{/if}}
  {{#if parent_id}}parent_id                                    = {{hclVal parent_id}}{{/if}}
  {{#if peer_authentication}}peer_authentication                          = {{hclVal peer_authentication}}{{/if}}
  {{#if peer_authentication_enabled}}peer_authentication_enabled                  = {{hclVal peer_authentication_enabled}}{{/if}}
  {{#if peer_traffic_configuration}}peer_traffic_configuration                   = {{hclVal peer_traffic_configuration}}{{/if}}
  {{#if peer_traffic_encryption_enabled}}peer_traffic_encryption_enabled              = {{hclVal peer_traffic_encryption_enabled}}{{/if}}
  {{#if public_network_access}}public_network_access                        = {{hclVal public_network_access}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled                = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                             = {{hclVal role_assignments}}{{/if}}
  {{#if shared_key}}shared_key                                   = {{hclVal shared_key}}{{/if}}
  {{#if shared_key_version}}shared_key_version                           = {{hclVal shared_key_version}}{{/if}}
  {{#if storages}}storages                                     = {{hclVal storages}}{{/if}}
  {{#if tags}}tags                                         = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                     = {{hclVal timeouts}}{{/if}}
  {{#if vnet_configuration}}vnet_configuration                           = {{hclVal vnet_configuration}}{{/if}}
  {{#if workload_profile}}workload_profile                             = {{hclVal workload_profile}}{{/if}}
  {{#if workload_profiles}}workload_profiles                            = {{hclVal workload_profiles}}{{/if}}
  {{#if zone_redundancy_enabled}}zone_redundancy_enabled                      = {{hclVal zone_redundancy_enabled}}{{/if}}
  {{#if zone_redundant}}zone_redundant                               = {{hclVal zone_redundant}}{{/if}}
}
