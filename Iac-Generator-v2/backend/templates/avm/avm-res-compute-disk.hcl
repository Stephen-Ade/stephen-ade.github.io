terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-disk" {
  source  = "Azure/avm-res-compute-disk/azurerm"
  version = "0.3.2"

  {{#create_option}}create_option                           = {{{create_option}}}{{/create_option}}
  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#storage_account_type}}storage_account_type                    = {{{storage_account_type}}}{{/storage_account_type}}
  {{#zone}}zone                                    = {{{zone}}}{{/zone}}
  {{#disk_access_id}}disk_access_id                          = {{{disk_access_id}}}{{/disk_access_id}}
  {{#disk_encryption_set_id}}disk_encryption_set_id                  = {{{disk_encryption_set_id}}}{{/disk_encryption_set_id}}
  {{#disk_iops_read_only}}disk_iops_read_only                     = {{{disk_iops_read_only}}}{{/disk_iops_read_only}}
  {{#disk_iops_read_write}}disk_iops_read_write                    = {{{disk_iops_read_write}}}{{/disk_iops_read_write}}
  {{#disk_mbps_read_only}}disk_mbps_read_only                     = {{{disk_mbps_read_only}}}{{/disk_mbps_read_only}}
  {{#disk_mbps_read_write}}disk_mbps_read_write                    = {{{disk_mbps_read_write}}}{{/disk_mbps_read_write}}
  {{#disk_size_gb}}disk_size_gb                            = {{{disk_size_gb}}}{{/disk_size_gb}}
  {{#edge_zone}}edge_zone                               = {{{edge_zone}}}{{/edge_zone}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#encryption_settings}}encryption_settings                     = {{{encryption_settings}}}{{/encryption_settings}}
  {{#gallery_image_reference_id}}gallery_image_reference_id              = {{{gallery_image_reference_id}}}{{/gallery_image_reference_id}}
  {{#hyper_v_generation}}hyper_v_generation                      = {{{hyper_v_generation}}}{{/hyper_v_generation}}
  {{#image_reference_id}}image_reference_id                      = {{{image_reference_id}}}{{/image_reference_id}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#logical_sector_size}}logical_sector_size                     = {{{logical_sector_size}}}{{/logical_sector_size}}
  {{#max_shares}}max_shares                              = {{{max_shares}}}{{/max_shares}}
  {{#network_access_policy}}network_access_policy                   = {{{network_access_policy}}}{{/network_access_policy}}
  {{#on_demand_bursting_enabled}}on_demand_bursting_enabled              = {{{on_demand_bursting_enabled}}}{{/on_demand_bursting_enabled}}
  {{#optimized_frequent_attach_enabled}}optimized_frequent_attach_enabled       = {{{optimized_frequent_attach_enabled}}}{{/optimized_frequent_attach_enabled}}
  {{#os_type}}os_type                                 = {{{os_type}}}{{/os_type}}
  {{#performance_plus_enabled}}performance_plus_enabled                = {{{performance_plus_enabled}}}{{/performance_plus_enabled}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#secure_vm_disk_encryption_set_id}}secure_vm_disk_encryption_set_id        = {{{secure_vm_disk_encryption_set_id}}}{{/secure_vm_disk_encryption_set_id}}
  {{#security_type}}security_type                           = {{{security_type}}}{{/security_type}}
  {{#source_resource_id}}source_resource_id                      = {{{source_resource_id}}}{{/source_resource_id}}
  {{#source_uri}}source_uri                              = {{{source_uri}}}{{/source_uri}}
  {{#storage_account_id}}storage_account_id                      = {{{storage_account_id}}}{{/storage_account_id}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#tier}}tier                                    = {{{tier}}}{{/tier}}
  {{#trusted_launch_enabled}}trusted_launch_enabled                  = {{{trusted_launch_enabled}}}{{/trusted_launch_enabled}}
  {{#upload_size_bytes}}upload_size_bytes                       = {{{upload_size_bytes}}}{{/upload_size_bytes}}
}
