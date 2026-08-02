terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-oracledatabase-cloudvmcluster" {
  source  = "Azure/avm-res-oracledatabase-cloudvmcluster/azurerm"
  version = "0.3.2"

  {{#cloud_exadata_infrastructure_id}}cloud_exadata_infrastructure_id         = {{{cloud_exadata_infrastructure_id}}}{{/cloud_exadata_infrastructure_id}}
  {{#cluster_name}}cluster_name                            = {{{cluster_name}}}{{/cluster_name}}
  {{#cpu_core_count}}cpu_core_count                          = {{{cpu_core_count}}}{{/cpu_core_count}}
  {{#data_storage_size_in_tbs}}data_storage_size_in_tbs                = {{{data_storage_size_in_tbs}}}{{/data_storage_size_in_tbs}}
  {{#dbnode_storage_size_in_gbs}}dbnode_storage_size_in_gbs              = {{{dbnode_storage_size_in_gbs}}}{{/dbnode_storage_size_in_gbs}}
  {{#hostname}}hostname                                = {{{hostname}}}{{/hostname}}
  {{#location}}location                                = {{{location}}}{{/location}}
  {{#memory_size_in_gbs}}memory_size_in_gbs                      = {{{memory_size_in_gbs}}}{{/memory_size_in_gbs}}
  {{#resource_group_id}}resource_group_id                       = {{{resource_group_id}}}{{/resource_group_id}}
  {{#ssh_public_keys}}ssh_public_keys                         = {{{ssh_public_keys}}}{{/ssh_public_keys}}
  {{#subnet_id}}subnet_id                               = {{{subnet_id}}}{{/subnet_id}}
  {{#vnet_id}}vnet_id                                 = {{{vnet_id}}}{{/vnet_id}}
  {{#backup_subnet_cidr}}backup_subnet_cidr                      = {{{backup_subnet_cidr}}}{{/backup_subnet_cidr}}
  {{#data_storage_percentage}}data_storage_percentage                 = {{{data_storage_percentage}}}{{/data_storage_percentage}}
  {{#db_servers}}db_servers                              = {{{db_servers}}}{{/db_servers}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#domain}}domain                                  = {{{domain}}}{{/domain}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#file_system_configuration_details}}file_system_configuration_details       = {{{file_system_configuration_details}}}{{/file_system_configuration_details}}
  {{#gi_version}}gi_version                              = {{{gi_version}}}{{/gi_version}}
  {{#is_diagnostic_events_enabled}}is_diagnostic_events_enabled            = {{{is_diagnostic_events_enabled}}}{{/is_diagnostic_events_enabled}}
  {{#is_health_monitoring_enabled}}is_health_monitoring_enabled            = {{{is_health_monitoring_enabled}}}{{/is_health_monitoring_enabled}}
  {{#is_incident_logs_enabled}}is_incident_logs_enabled                = {{{is_incident_logs_enabled}}}{{/is_incident_logs_enabled}}
  {{#is_local_backup_enabled}}is_local_backup_enabled                 = {{{is_local_backup_enabled}}}{{/is_local_backup_enabled}}
  {{#is_sparse_diskgroup_enabled}}is_sparse_diskgroup_enabled             = {{{is_sparse_diskgroup_enabled}}}{{/is_sparse_diskgroup_enabled}}
  {{#license_model}}license_model                           = {{{license_model}}}{{/license_model}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#nsg_cidrs}}nsg_cidrs                               = {{{nsg_cidrs}}}{{/nsg_cidrs}}
  {{#ocpu_count}}ocpu_count                              = {{{ocpu_count}}}{{/ocpu_count}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#scan_listener_port_tcp}}scan_listener_port_tcp                  = {{{scan_listener_port_tcp}}}{{/scan_listener_port_tcp}}
  {{#scan_listener_port_tcp_ssl}}scan_listener_port_tcp_ssl              = {{{scan_listener_port_tcp_ssl}}}{{/scan_listener_port_tcp_ssl}}
  {{#storage_size_in_gbs}}storage_size_in_gbs                     = {{{storage_size_in_gbs}}}{{/storage_size_in_gbs}}
  {{#system_version}}system_version                          = {{{system_version}}}{{/system_version}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#time_zone}}time_zone                               = {{{time_zone}}}{{/time_zone}}
  {{#zone_id}}zone_id                                 = {{{zone_id}}}{{/zone_id}}
}
