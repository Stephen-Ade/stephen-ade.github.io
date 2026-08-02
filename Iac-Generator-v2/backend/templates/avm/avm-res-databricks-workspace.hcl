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

  {{#location}}location                                            = {{{location}}}{{/location}}
  {{#name}}name                                                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                                 = {{{resource_group_name}}}{{/resource_group_name}}
  {{#sku}}sku                                                 = {{{sku}}}{{/sku}}
  {{#access_connector}}access_connector                                    = {{{access_connector}}}{{/access_connector}}
  {{#access_connector_id}}access_connector_id                                 = {{{access_connector_id}}}{{/access_connector_id}}
  {{#compute_mode}}compute_mode                                        = {{{compute_mode}}}{{/compute_mode}}
  {{#custom_parameters}}custom_parameters                                   = {{{custom_parameters}}}{{/custom_parameters}}
  {{#customer_managed_key_enabled}}customer_managed_key_enabled                        = {{{customer_managed_key_enabled}}}{{/customer_managed_key_enabled}}
  {{#dbfs_root_cmk_key_vault_key_id}}dbfs_root_cmk_key_vault_key_id                      = {{{dbfs_root_cmk_key_vault_key_id}}}{{/dbfs_root_cmk_key_vault_key_id}}
  {{#default_catalog}}default_catalog                                     = {{{default_catalog}}}{{/default_catalog}}
  {{#default_storage_firewall_enabled}}default_storage_firewall_enabled                    = {{{default_storage_firewall_enabled}}}{{/default_storage_firewall_enabled}}
  {{#diagnostic_settings}}diagnostic_settings                                 = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                                    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#enhanced_security_compliance}}enhanced_security_compliance                        = {{{enhanced_security_compliance}}}{{/enhanced_security_compliance}}
  {{#infrastructure_encryption_enabled}}infrastructure_encryption_enabled                   = {{{infrastructure_encryption_enabled}}}{{/infrastructure_encryption_enabled}}
  {{#load_balancer_backend_address_pool_id}}load_balancer_backend_address_pool_id               = {{{load_balancer_backend_address_pool_id}}}{{/load_balancer_backend_address_pool_id}}
  {{#lock}}lock                                                = {{{lock}}}{{/lock}}
  {{#managed_disk_cmk_key_vault_key_id}}managed_disk_cmk_key_vault_key_id                   = {{{managed_disk_cmk_key_vault_key_id}}}{{/managed_disk_cmk_key_vault_key_id}}
  {{#managed_disk_cmk_rotation_to_latest_version_enabled}}managed_disk_cmk_rotation_to_latest_version_enabled = {{{managed_disk_cmk_rotation_to_latest_version_enabled}}}{{/managed_disk_cmk_rotation_to_latest_version_enabled}}
  {{#managed_resource_group_name}}managed_resource_group_name                         = {{{managed_resource_group_name}}}{{/managed_resource_group_name}}
  {{#managed_services_cmk_key_vault_key_id}}managed_services_cmk_key_vault_key_id               = {{{managed_services_cmk_key_vault_key_id}}}{{/managed_services_cmk_key_vault_key_id}}
  {{#network_security_group_rules_required}}network_security_group_rules_required               = {{{network_security_group_rules_required}}}{{/network_security_group_rules_required}}
  {{#private_endpoints}}private_endpoints                                   = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group             = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled                       = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                                    = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                                = {{{tags}}}{{/tags}}
  {{#virtual_network_peering}}virtual_network_peering                             = {{{virtual_network_peering}}}{{/virtual_network_peering}}
}
