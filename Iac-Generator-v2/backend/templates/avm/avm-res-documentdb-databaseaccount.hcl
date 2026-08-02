terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-documentdb-databaseaccount" {
  source  = "Azure/avm-res-documentdb-databaseaccount/azurerm"
  version = "0.10.0"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#access_key_metadata_writes_enabled}}access_key_metadata_writes_enabled      = {{{access_key_metadata_writes_enabled}}}{{/access_key_metadata_writes_enabled}}
  {{#analytical_storage_config}}analytical_storage_config               = {{{analytical_storage_config}}}{{/analytical_storage_config}}
  {{#analytical_storage_enabled}}analytical_storage_enabled              = {{{analytical_storage_enabled}}}{{/analytical_storage_enabled}}
  {{#automatic_failover_enabled}}automatic_failover_enabled              = {{{automatic_failover_enabled}}}{{/automatic_failover_enabled}}
  {{#backup}}backup                                  = {{{backup}}}{{/backup}}
  {{#capabilities}}capabilities                            = {{{capabilities}}}{{/capabilities}}
  {{#capacity}}capacity                                = {{{capacity}}}{{/capacity}}
  {{#consistency_policy}}consistency_policy                      = {{{consistency_policy}}}{{/consistency_policy}}
  {{#cors_rule}}cors_rule                               = {{{cors_rule}}}{{/cors_rule}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#free_tier_enabled}}free_tier_enabled                       = {{{free_tier_enabled}}}{{/free_tier_enabled}}
  {{#geo_locations}}geo_locations                           = {{{geo_locations}}}{{/geo_locations}}
  {{#gremlin_databases}}gremlin_databases                       = {{{gremlin_databases}}}{{/gremlin_databases}}
  {{#ip_range_filter}}ip_range_filter                         = {{{ip_range_filter}}}{{/ip_range_filter}}
  {{#local_authentication_disabled}}local_authentication_disabled           = {{{local_authentication_disabled}}}{{/local_authentication_disabled}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#minimal_tls_version}}minimal_tls_version                     = {{{minimal_tls_version}}}{{/minimal_tls_version}}
  {{#mongo_databases}}mongo_databases                         = {{{mongo_databases}}}{{/mongo_databases}}
  {{#mongo_server_version}}mongo_server_version                    = {{{mongo_server_version}}}{{/mongo_server_version}}
  {{#multiple_write_locations_enabled}}multiple_write_locations_enabled        = {{{multiple_write_locations_enabled}}}{{/multiple_write_locations_enabled}}
  {{#network_acl_bypass_for_azure_services}}network_acl_bypass_for_azure_services   = {{{network_acl_bypass_for_azure_services}}}{{/network_acl_bypass_for_azure_services}}
  {{#network_acl_bypass_resource_ids}}network_acl_bypass_resource_ids         = {{{network_acl_bypass_resource_ids}}}{{/network_acl_bypass_resource_ids}}
  {{#partition_merge_enabled}}partition_merge_enabled                 = {{{partition_merge_enabled}}}{{/partition_merge_enabled}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#sql_databases}}sql_databases                           = {{{sql_databases}}}{{/sql_databases}}
  {{#sql_dedicated_gateway}}sql_dedicated_gateway                   = {{{sql_dedicated_gateway}}}{{/sql_dedicated_gateway}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#virtual_network_rules}}virtual_network_rules                   = {{{virtual_network_rules}}}{{/virtual_network_rules}}
}
