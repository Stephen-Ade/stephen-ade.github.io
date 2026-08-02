terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_documentdb_databaseaccount" {
  source  = "Azure/avm-res-documentdb-databaseaccount/azurerm"
  version = "0.10.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if access_key_metadata_writes_enabled}}access_key_metadata_writes_enabled      = {{hclVal access_key_metadata_writes_enabled}}{{/if}}
  {{#if analytical_storage_config}}analytical_storage_config               = {{hclVal analytical_storage_config}}{{/if}}
  {{#if analytical_storage_enabled}}analytical_storage_enabled              = {{hclVal analytical_storage_enabled}}{{/if}}
  {{#if automatic_failover_enabled}}automatic_failover_enabled              = {{hclVal automatic_failover_enabled}}{{/if}}
  {{#if backup}}backup                                  = {{hclVal backup}}{{/if}}
  {{#if capabilities}}capabilities                            = {{hclVal capabilities}}{{/if}}
  {{#if capacity}}capacity                                = {{hclVal capacity}}{{/if}}
  {{#if consistency_policy}}consistency_policy                      = {{hclVal consistency_policy}}{{/if}}
  {{#if cors_rule}}cors_rule                               = {{hclVal cors_rule}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if free_tier_enabled}}free_tier_enabled                       = {{hclVal free_tier_enabled}}{{/if}}
  {{#if geo_locations}}geo_locations                           = {{hclVal geo_locations}}{{/if}}
  {{#if gremlin_databases}}gremlin_databases                       = {{hclVal gremlin_databases}}{{/if}}
  {{#if ip_range_filter}}ip_range_filter                         = {{hclVal ip_range_filter}}{{/if}}
  {{#if local_authentication_disabled}}local_authentication_disabled           = {{hclVal local_authentication_disabled}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if minimal_tls_version}}minimal_tls_version                     = {{hclVal minimal_tls_version}}{{/if}}
  {{#if mongo_databases}}mongo_databases                         = {{hclVal mongo_databases}}{{/if}}
  {{#if mongo_server_version}}mongo_server_version                    = {{hclVal mongo_server_version}}{{/if}}
  {{#if multiple_write_locations_enabled}}multiple_write_locations_enabled        = {{hclVal multiple_write_locations_enabled}}{{/if}}
  {{#if network_acl_bypass_for_azure_services}}network_acl_bypass_for_azure_services   = {{hclVal network_acl_bypass_for_azure_services}}{{/if}}
  {{#if network_acl_bypass_resource_ids}}network_acl_bypass_resource_ids         = {{hclVal network_acl_bypass_resource_ids}}{{/if}}
  {{#if partition_merge_enabled}}partition_merge_enabled                 = {{hclVal partition_merge_enabled}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if sql_databases}}sql_databases                           = {{hclVal sql_databases}}{{/if}}
  {{#if sql_dedicated_gateway}}sql_dedicated_gateway                   = {{hclVal sql_dedicated_gateway}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if virtual_network_rules}}virtual_network_rules                   = {{hclVal virtual_network_rules}}{{/if}}
}
