terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_documentdb_mongocluster" {
  source  = "Azure/avm-res-documentdb-mongocluster/azurerm"
  version = "0.3.0"

  {{#if administrator_login}}administrator_login                     = {{hclVal administrator_login}}{{/if}}
  {{#if administrator_login_password}}administrator_login_password            = {{hclVal administrator_login_password}}{{/if}}
  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                               = {{hclVal parent_id}}{{/if}}
  {{#if auth_config_allowed_modes}}auth_config_allowed_modes               = {{hclVal auth_config_allowed_modes}}{{/if}}
  {{#if backup_policy_type}}backup_policy_type                      = {{hclVal backup_policy_type}}{{/if}}
  {{#if compute_tier}}compute_tier                            = {{hclVal compute_tier}}{{/if}}
  {{#if create_mode}}create_mode                             = {{hclVal create_mode}}{{/if}}
  {{#if data_api_mode}}data_api_mode                           = {{hclVal data_api_mode}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_ha}}enable_ha                               = {{hclVal enable_ha}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if firewall_rules}}firewall_rules                          = {{hclVal firewall_rules}}{{/if}}
  {{#if ha_mode}}ha_mode                                 = {{hclVal ha_mode}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if node_count}}node_count                              = {{hclVal node_count}}{{/if}}
  {{#if preview_features}}preview_features                        = {{hclVal preview_features}}{{/if}}
  {{#if private_endpoint_connections}}private_endpoint_connections            = {{hclVal private_endpoint_connections}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access}}public_network_access                   = {{hclVal public_network_access}}{{/if}}
  {{#if replica_parameters}}replica_parameters                      = {{hclVal replica_parameters}}{{/if}}
  {{#if resource_types}}resource_types                          = {{hclVal resource_types}}{{/if}}
  {{#if restore_parameters}}restore_parameters                      = {{hclVal restore_parameters}}{{/if}}
  {{#if retry}}retry                                   = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if server_version}}server_version                          = {{hclVal server_version}}{{/if}}
  {{#if shard_count}}shard_count                             = {{hclVal shard_count}}{{/if}}
  {{#if storage_size_gb}}storage_size_gb                         = {{hclVal storage_size_gb}}{{/if}}
  {{#if storage_type}}storage_type                            = {{hclVal storage_type}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                = {{hclVal timeouts}}{{/if}}
  {{#if users}}users                                   = {{hclVal users}}{{/if}}
}
