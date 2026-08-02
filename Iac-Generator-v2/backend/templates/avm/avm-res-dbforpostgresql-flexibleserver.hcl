terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-dbforpostgresql-flexibleserver" {
  source  = "Azure/avm-res-dbforpostgresql-flexibleserver/azurerm"
  version = "0.2.3"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#ad_administrator}}ad_administrator                        = {{{ad_administrator}}}{{/ad_administrator}}
  {{#administrator_login}}administrator_login                     = {{{administrator_login}}}{{/administrator_login}}
  {{#administrator_password}}administrator_password                  = {{{administrator_password}}}{{/administrator_password}}
  {{#administrator_password_wo}}administrator_password_wo               = {{{administrator_password_wo}}}{{/administrator_password_wo}}
  {{#administrator_password_wo_version}}administrator_password_wo_version       = {{{administrator_password_wo_version}}}{{/administrator_password_wo_version}}
  {{#authentication}}authentication                          = {{{authentication}}}{{/authentication}}
  {{#auto_grow_enabled}}auto_grow_enabled                       = {{{auto_grow_enabled}}}{{/auto_grow_enabled}}
  {{#backup_retention_days}}backup_retention_days                   = {{{backup_retention_days}}}{{/backup_retention_days}}
  {{#create_mode}}create_mode                             = {{{create_mode}}}{{/create_mode}}
  {{#databases}}databases                               = {{{databases}}}{{/databases}}
  {{#delegated_subnet_id}}delegated_subnet_id                     = {{{delegated_subnet_id}}}{{/delegated_subnet_id}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#firewall_rules}}firewall_rules                          = {{{firewall_rules}}}{{/firewall_rules}}
  {{#geo_redundant_backup_enabled}}geo_redundant_backup_enabled            = {{{geo_redundant_backup_enabled}}}{{/geo_redundant_backup_enabled}}
  {{#high_availability}}high_availability                       = {{{high_availability}}}{{/high_availability}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#maintenance_window}}maintenance_window                      = {{{maintenance_window}}}{{/maintenance_window}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#point_in_time_restore_time_in_utc}}point_in_time_restore_time_in_utc       = {{{point_in_time_restore_time_in_utc}}}{{/point_in_time_restore_time_in_utc}}
  {{#private_dns_zone_id}}private_dns_zone_id                     = {{{private_dns_zone_id}}}{{/private_dns_zone_id}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#replication_role}}replication_role                        = {{{replication_role}}}{{/replication_role}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#server_configuration}}server_configuration                    = {{{server_configuration}}}{{/server_configuration}}
  {{#server_version}}server_version                          = {{{server_version}}}{{/server_version}}
  {{#sku_name}}sku_name                                = {{{sku_name}}}{{/sku_name}}
  {{#source_server_id}}source_server_id                        = {{{source_server_id}}}{{/source_server_id}}
  {{#storage_mb}}storage_mb                              = {{{storage_mb}}}{{/storage_mb}}
  {{#storage_tier}}storage_tier                            = {{{storage_tier}}}{{/storage_tier}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                = {{{timeouts}}}{{/timeouts}}
  {{#virtual_endpoint}}virtual_endpoint                        = {{{virtual_endpoint}}}{{/virtual_endpoint}}
  {{#zone}}zone                                    = {{{zone}}}{{/zone}}
}
