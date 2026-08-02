terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-dbformysql-flexibleserver" {
  source  = "Azure/avm-res-dbformysql-flexibleserver/azurerm"
  version = "0.1.6"

  {{#location}}location                                    = {{{location}}}{{/location}}
  {{#name}}name                                        = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                         = {{{resource_group_name}}}{{/resource_group_name}}
  {{#active_directory_administrator}}active_directory_administrator              = {{{active_directory_administrator}}}{{/active_directory_administrator}}
  {{#active_directory_administrator_wait_seconds}}active_directory_administrator_wait_seconds = {{{active_directory_administrator_wait_seconds}}}{{/active_directory_administrator_wait_seconds}}
  {{#administrator_login}}administrator_login                         = {{{administrator_login}}}{{/administrator_login}}
  {{#administrator_password}}administrator_password                      = {{{administrator_password}}}{{/administrator_password}}
  {{#administrator_password_wo}}administrator_password_wo                   = {{{administrator_password_wo}}}{{/administrator_password_wo}}
  {{#administrator_password_wo_version}}administrator_password_wo_version           = {{{administrator_password_wo_version}}}{{/administrator_password_wo_version}}
  {{#backup_retention_days}}backup_retention_days                       = {{{backup_retention_days}}}{{/backup_retention_days}}
  {{#create_mode}}create_mode                                 = {{{create_mode}}}{{/create_mode}}
  {{#databases}}databases                                   = {{{databases}}}{{/databases}}
  {{#delegated_subnet_id}}delegated_subnet_id                         = {{{delegated_subnet_id}}}{{/delegated_subnet_id}}
  {{#diagnostic_settings}}diagnostic_settings                         = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                            = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#firewall_rules}}firewall_rules                              = {{{firewall_rules}}}{{/firewall_rules}}
  {{#geo_redundant_backup_enabled}}geo_redundant_backup_enabled                = {{{geo_redundant_backup_enabled}}}{{/geo_redundant_backup_enabled}}
  {{#high_availability}}high_availability                           = {{{high_availability}}}{{/high_availability}}
  {{#lock}}lock                                        = {{{lock}}}{{/lock}}
  {{#maintenance_window}}maintenance_window                          = {{{maintenance_window}}}{{/maintenance_window}}
  {{#managed_identities}}managed_identities                          = {{{managed_identities}}}{{/managed_identities}}
  {{#mysql_version}}mysql_version                               = {{{mysql_version}}}{{/mysql_version}}
  {{#point_in_time_restore_time_in_utc}}point_in_time_restore_time_in_utc           = {{{point_in_time_restore_time_in_utc}}}{{/point_in_time_restore_time_in_utc}}
  {{#private_dns_zone_id}}private_dns_zone_id                         = {{{private_dns_zone_id}}}{{/private_dns_zone_id}}
  {{#private_endpoints}}private_endpoints                           = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group     = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access}}public_network_access                       = {{{public_network_access}}}{{/public_network_access}}
  {{#replication_role}}replication_role                            = {{{replication_role}}}{{/replication_role}}
  {{#role_assignments}}role_assignments                            = {{{role_assignments}}}{{/role_assignments}}
  {{#server_configuration}}server_configuration                        = {{{server_configuration}}}{{/server_configuration}}
  {{#sku_name}}sku_name                                    = {{{sku_name}}}{{/sku_name}}
  {{#source_server_id}}source_server_id                            = {{{source_server_id}}}{{/source_server_id}}
  {{#storage}}storage                                     = {{{storage}}}{{/storage}}
  {{#tags}}tags                                        = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                    = {{{timeouts}}}{{/timeouts}}
  {{#zone}}zone                                        = {{{zone}}}{{/zone}}
}
