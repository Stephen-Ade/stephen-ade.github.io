terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-documentdb-mongocluster" {
  source  = "Azure/avm-res-documentdb-mongocluster/azurerm"
  version = "0.3.0"

  {{#administrator_login}}administrator_login                     = {{{administrator_login}}}{{/administrator_login}}
  {{#administrator_login_password}}administrator_login_password            = {{{administrator_login_password}}}{{/administrator_login_password}}
  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                               = {{{parent_id}}}{{/parent_id}}
  {{#auth_config_allowed_modes}}auth_config_allowed_modes               = {{{auth_config_allowed_modes}}}{{/auth_config_allowed_modes}}
  {{#backup_policy_type}}backup_policy_type                      = {{{backup_policy_type}}}{{/backup_policy_type}}
  {{#compute_tier}}compute_tier                            = {{{compute_tier}}}{{/compute_tier}}
  {{#create_mode}}create_mode                             = {{{create_mode}}}{{/create_mode}}
  {{#data_api_mode}}data_api_mode                           = {{{data_api_mode}}}{{/data_api_mode}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_ha}}enable_ha                               = {{{enable_ha}}}{{/enable_ha}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#firewall_rules}}firewall_rules                          = {{{firewall_rules}}}{{/firewall_rules}}
  {{#ha_mode}}ha_mode                                 = {{{ha_mode}}}{{/ha_mode}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#node_count}}node_count                              = {{{node_count}}}{{/node_count}}
  {{#preview_features}}preview_features                        = {{{preview_features}}}{{/preview_features}}
  {{#private_endpoint_connections}}private_endpoint_connections            = {{{private_endpoint_connections}}}{{/private_endpoint_connections}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access}}public_network_access                   = {{{public_network_access}}}{{/public_network_access}}
  {{#replica_parameters}}replica_parameters                      = {{{replica_parameters}}}{{/replica_parameters}}
  {{#resource_types}}resource_types                          = {{{resource_types}}}{{/resource_types}}
  {{#restore_parameters}}restore_parameters                      = {{{restore_parameters}}}{{/restore_parameters}}
  {{#retry}}retry                                   = {{{retry}}}{{/retry}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#server_version}}server_version                          = {{{server_version}}}{{/server_version}}
  {{#shard_count}}shard_count                             = {{{shard_count}}}{{/shard_count}}
  {{#storage_size_gb}}storage_size_gb                         = {{{storage_size_gb}}}{{/storage_size_gb}}
  {{#storage_type}}storage_type                            = {{{storage_type}}}{{/storage_type}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                = {{{timeouts}}}{{/timeouts}}
  {{#users}}users                                   = {{{users}}}{{/users}}
}
