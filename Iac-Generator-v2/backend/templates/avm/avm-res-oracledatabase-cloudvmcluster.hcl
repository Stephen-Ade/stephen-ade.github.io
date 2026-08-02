terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_oracledatabase_cloudvmcluster" {
  source  = "Azure/avm-res-oracledatabase-cloudvmcluster/azurerm"
  version = "0.3.2"

  {{#if cloud_exadata_infrastructure_id}}cloud_exadata_infrastructure_id         = {{hclVal cloud_exadata_infrastructure_id}}{{/if}}
  {{#if cluster_name}}cluster_name                            = {{hclVal cluster_name}}{{/if}}
  {{#if cpu_core_count}}cpu_core_count                          = {{hclVal cpu_core_count}}{{/if}}
  {{#if data_storage_size_in_tbs}}data_storage_size_in_tbs                = {{hclVal data_storage_size_in_tbs}}{{/if}}
  {{#if dbnode_storage_size_in_gbs}}dbnode_storage_size_in_gbs              = {{hclVal dbnode_storage_size_in_gbs}}{{/if}}
  {{#if hostname}}hostname                                = {{hclVal hostname}}{{/if}}
  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if memory_size_in_gbs}}memory_size_in_gbs                      = {{hclVal memory_size_in_gbs}}{{/if}}
  {{#if resource_group_id}}resource_group_id                       = {{hclVal resource_group_id}}{{/if}}
  {{#if ssh_public_keys}}ssh_public_keys                         = {{hclVal ssh_public_keys}}{{/if}}
  {{#if subnet_id}}subnet_id                               = {{hclVal subnet_id}}{{/if}}
  {{#if vnet_id}}vnet_id                                 = {{hclVal vnet_id}}{{/if}}
  {{#if backup_subnet_cidr}}backup_subnet_cidr                      = {{hclVal backup_subnet_cidr}}{{/if}}
  {{#if data_storage_percentage}}data_storage_percentage                 = {{hclVal data_storage_percentage}}{{/if}}
  {{#if db_servers}}db_servers                              = {{hclVal db_servers}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if domain}}domain                                  = {{hclVal domain}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if file_system_configuration_details}}file_system_configuration_details       = {{hclVal file_system_configuration_details}}{{/if}}
  {{#if gi_version}}gi_version                              = {{hclVal gi_version}}{{/if}}
  {{#if is_diagnostic_events_enabled}}is_diagnostic_events_enabled            = {{hclVal is_diagnostic_events_enabled}}{{/if}}
  {{#if is_health_monitoring_enabled}}is_health_monitoring_enabled            = {{hclVal is_health_monitoring_enabled}}{{/if}}
  {{#if is_incident_logs_enabled}}is_incident_logs_enabled                = {{hclVal is_incident_logs_enabled}}{{/if}}
  {{#if is_local_backup_enabled}}is_local_backup_enabled                 = {{hclVal is_local_backup_enabled}}{{/if}}
  {{#if is_sparse_diskgroup_enabled}}is_sparse_diskgroup_enabled             = {{hclVal is_sparse_diskgroup_enabled}}{{/if}}
  {{#if license_model}}license_model                           = {{hclVal license_model}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if nsg_cidrs}}nsg_cidrs                               = {{hclVal nsg_cidrs}}{{/if}}
  {{#if ocpu_count}}ocpu_count                              = {{hclVal ocpu_count}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if scan_listener_port_tcp}}scan_listener_port_tcp                  = {{hclVal scan_listener_port_tcp}}{{/if}}
  {{#if scan_listener_port_tcp_ssl}}scan_listener_port_tcp_ssl              = {{hclVal scan_listener_port_tcp_ssl}}{{/if}}
  {{#if storage_size_in_gbs}}storage_size_in_gbs                     = {{hclVal storage_size_in_gbs}}{{/if}}
  {{#if system_version}}system_version                          = {{hclVal system_version}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if time_zone}}time_zone                               = {{hclVal time_zone}}{{/if}}
  {{#if zone_id}}zone_id                                 = {{hclVal zone_id}}{{/if}}
}
