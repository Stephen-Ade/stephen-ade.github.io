terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_dbformysql_flexibleserver" {
  source  = "Azure/avm-res-dbformysql-flexibleserver/azurerm"
  version = "0.1.6"

  {{#if location}}location                                    = {{hclVal location}}{{/if}}
  {{#if name}}name                                        = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                         = {{hclVal resource_group_name}}{{/if}}
  {{#if active_directory_administrator}}active_directory_administrator              = {{hclVal active_directory_administrator}}{{/if}}
  {{#if active_directory_administrator_wait_seconds}}active_directory_administrator_wait_seconds = {{hclVal active_directory_administrator_wait_seconds}}{{/if}}
  {{#if administrator_login}}administrator_login                         = {{hclVal administrator_login}}{{/if}}
  {{#if administrator_password}}administrator_password                      = {{hclVal administrator_password}}{{/if}}
  {{#if administrator_password_wo}}administrator_password_wo                   = {{hclVal administrator_password_wo}}{{/if}}
  {{#if administrator_password_wo_version}}administrator_password_wo_version           = {{hclVal administrator_password_wo_version}}{{/if}}
  {{#if backup_retention_days}}backup_retention_days                       = {{hclVal backup_retention_days}}{{/if}}
  {{#if create_mode}}create_mode                                 = {{hclVal create_mode}}{{/if}}
  {{#if databases}}databases                                   = {{hclVal databases}}{{/if}}
  {{#if delegated_subnet_id}}delegated_subnet_id                         = {{hclVal delegated_subnet_id}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                         = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                            = {{hclVal enable_telemetry}}{{/if}}
  {{#if firewall_rules}}firewall_rules                              = {{hclVal firewall_rules}}{{/if}}
  {{#if geo_redundant_backup_enabled}}geo_redundant_backup_enabled                = {{hclVal geo_redundant_backup_enabled}}{{/if}}
  {{#if high_availability}}high_availability                           = {{hclVal high_availability}}{{/if}}
  {{#if lock}}lock                                        = {{hclVal lock}}{{/if}}
  {{#if maintenance_window}}maintenance_window                          = {{hclVal maintenance_window}}{{/if}}
  {{#if managed_identities}}managed_identities                          = {{hclVal managed_identities}}{{/if}}
  {{#if mysql_version}}mysql_version                               = {{hclVal mysql_version}}{{/if}}
  {{#if point_in_time_restore_time_in_utc}}point_in_time_restore_time_in_utc           = {{hclVal point_in_time_restore_time_in_utc}}{{/if}}
  {{#if private_dns_zone_id}}private_dns_zone_id                         = {{hclVal private_dns_zone_id}}{{/if}}
  {{#if private_endpoints}}private_endpoints                           = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group     = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access}}public_network_access                       = {{hclVal public_network_access}}{{/if}}
  {{#if replication_role}}replication_role                            = {{hclVal replication_role}}{{/if}}
  {{#if role_assignments}}role_assignments                            = {{hclVal role_assignments}}{{/if}}
  {{#if server_configuration}}server_configuration                        = {{hclVal server_configuration}}{{/if}}
  {{#if sku_name}}sku_name                                    = {{hclVal sku_name}}{{/if}}
  {{#if source_server_id}}source_server_id                            = {{hclVal source_server_id}}{{/if}}
  {{#if storage}}storage                                     = {{hclVal storage}}{{/if}}
  {{#if tags}}tags                                        = {{hclVal tags}}{{/if}}
  {{#if zone}}zone                                        = {{hclVal zone}}{{/if}}
}
