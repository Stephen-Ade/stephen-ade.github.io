terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_compute_disk" {
  source  = "Azure/avm-res-compute-disk/azurerm"
  version = "0.3.2"

  {{#if create_option}}create_option                           = {{hclVal create_option}}{{/if}}
  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if storage_account_type}}storage_account_type                    = {{hclVal storage_account_type}}{{/if}}
  {{#if zone}}zone                                    = {{hclVal zone}}{{/if}}
  {{#if disk_access_id}}disk_access_id                          = {{hclVal disk_access_id}}{{/if}}
  {{#if disk_encryption_set_id}}disk_encryption_set_id                  = {{hclVal disk_encryption_set_id}}{{/if}}
  {{#if disk_iops_read_only}}disk_iops_read_only                     = {{hclVal disk_iops_read_only}}{{/if}}
  {{#if disk_iops_read_write}}disk_iops_read_write                    = {{hclVal disk_iops_read_write}}{{/if}}
  {{#if disk_mbps_read_only}}disk_mbps_read_only                     = {{hclVal disk_mbps_read_only}}{{/if}}
  {{#if disk_mbps_read_write}}disk_mbps_read_write                    = {{hclVal disk_mbps_read_write}}{{/if}}
  {{#if disk_size_gb}}disk_size_gb                            = {{hclVal disk_size_gb}}{{/if}}
  {{#if edge_zone}}edge_zone                               = {{hclVal edge_zone}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if encryption_settings}}encryption_settings                     = {{hclVal encryption_settings}}{{/if}}
  {{#if gallery_image_reference_id}}gallery_image_reference_id              = {{hclVal gallery_image_reference_id}}{{/if}}
  {{#if hyper_v_generation}}hyper_v_generation                      = {{hclVal hyper_v_generation}}{{/if}}
  {{#if image_reference_id}}image_reference_id                      = {{hclVal image_reference_id}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if logical_sector_size}}logical_sector_size                     = {{hclVal logical_sector_size}}{{/if}}
  {{#if max_shares}}max_shares                              = {{hclVal max_shares}}{{/if}}
  {{#if network_access_policy}}network_access_policy                   = {{hclVal network_access_policy}}{{/if}}
  {{#if on_demand_bursting_enabled}}on_demand_bursting_enabled              = {{hclVal on_demand_bursting_enabled}}{{/if}}
  {{#if optimized_frequent_attach_enabled}}optimized_frequent_attach_enabled       = {{hclVal optimized_frequent_attach_enabled}}{{/if}}
  {{#if os_type}}os_type                                 = {{hclVal os_type}}{{/if}}
  {{#if performance_plus_enabled}}performance_plus_enabled                = {{hclVal performance_plus_enabled}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if secure_vm_disk_encryption_set_id}}secure_vm_disk_encryption_set_id        = {{hclVal secure_vm_disk_encryption_set_id}}{{/if}}
  {{#if security_type}}security_type                           = {{hclVal security_type}}{{/if}}
  {{#if source_resource_id}}source_resource_id                      = {{hclVal source_resource_id}}{{/if}}
  {{#if source_uri}}source_uri                              = {{hclVal source_uri}}{{/if}}
  {{#if storage_account_id}}storage_account_id                      = {{hclVal storage_account_id}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if tier}}tier                                    = {{hclVal tier}}{{/if}}
  {{#if trusted_launch_enabled}}trusted_launch_enabled                  = {{hclVal trusted_launch_enabled}}{{/if}}
  {{#if upload_size_bytes}}upload_size_bytes                       = {{hclVal upload_size_bytes}}{{/if}}
}
