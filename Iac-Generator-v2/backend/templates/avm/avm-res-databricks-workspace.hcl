terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-databricks-workspace" {
  source  = "Azure/avm-res-databricks-workspace/azurerm"
  version = "0.5.0"

  {{#if location}}location                                            = {{hclVal location}}{{/if}}
  {{#if name}}name                                                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                                 = {{hclVal resource_group_name}}{{/if}}
  {{#if sku}}sku                                                 = {{hclVal sku}}{{/if}}
  {{#if access_connector}}access_connector                                    = {{hclVal access_connector}}{{/if}}
  {{#if access_connector_id}}access_connector_id                                 = {{hclVal access_connector_id}}{{/if}}
  {{#if compute_mode}}compute_mode                                        = {{hclVal compute_mode}}{{/if}}
  {{#if custom_parameters}}custom_parameters                                   = {{hclVal custom_parameters}}{{/if}}
  {{#if customer_managed_key_enabled}}customer_managed_key_enabled                        = {{hclVal customer_managed_key_enabled}}{{/if}}
  {{#if dbfs_root_cmk_key_vault_key_id}}dbfs_root_cmk_key_vault_key_id                      = {{hclVal dbfs_root_cmk_key_vault_key_id}}{{/if}}
  {{#if default_catalog}}default_catalog                                     = {{hclVal default_catalog}}{{/if}}
  {{#if default_storage_firewall_enabled}}default_storage_firewall_enabled                    = {{hclVal default_storage_firewall_enabled}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                                 = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                    = {{hclVal enable_telemetry}}{{/if}}
  {{#if enhanced_security_compliance}}enhanced_security_compliance                        = {{hclVal enhanced_security_compliance}}{{/if}}
  {{#if infrastructure_encryption_enabled}}infrastructure_encryption_enabled                   = {{hclVal infrastructure_encryption_enabled}}{{/if}}
  {{#if load_balancer_backend_address_pool_id}}load_balancer_backend_address_pool_id               = {{hclVal load_balancer_backend_address_pool_id}}{{/if}}
  {{#if lock}}lock                                                = {{hclVal lock}}{{/if}}
  {{#if managed_disk_cmk_key_vault_key_id}}managed_disk_cmk_key_vault_key_id                   = {{hclVal managed_disk_cmk_key_vault_key_id}}{{/if}}
  {{#if managed_disk_cmk_rotation_to_latest_version_enabled}}managed_disk_cmk_rotation_to_latest_version_enabled = {{hclVal managed_disk_cmk_rotation_to_latest_version_enabled}}{{/if}}
  {{#if managed_resource_group_name}}managed_resource_group_name                         = {{hclVal managed_resource_group_name}}{{/if}}
  {{#if managed_services_cmk_key_vault_key_id}}managed_services_cmk_key_vault_key_id               = {{hclVal managed_services_cmk_key_vault_key_id}}{{/if}}
  {{#if network_security_group_rules_required}}network_security_group_rules_required               = {{hclVal network_security_group_rules_required}}{{/if}}
  {{#if private_endpoints}}private_endpoints                                   = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group             = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled                       = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                                    = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                                = {{hclVal tags}}{{/if}}
  {{#if virtual_network_peering}}virtual_network_peering                             = {{hclVal virtual_network_peering}}{{/if}}
}
