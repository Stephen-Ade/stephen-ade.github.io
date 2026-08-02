terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-virtualmachinescaleset" {
  source  = "Azure/avm-res-compute-virtualmachinescaleset/azurerm"
  version = "0.9.0"

  {{#extension_protected_setting}}extension_protected_setting         = {{{extension_protected_setting}}}{{/extension_protected_setting}}
  {{#location}}location                            = {{{location}}}{{/location}}
  {{#name}}name                                = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                           = {{{parent_id}}}{{/parent_id}}
  {{#user_data_base64}}user_data_base64                    = {{{user_data_base64}}}{{/user_data_base64}}
  {{#additional_capabilities}}additional_capabilities             = {{{additional_capabilities}}}{{/additional_capabilities}}
  {{#admin_password}}admin_password                      = {{{admin_password}}}{{/admin_password}}
  {{#admin_password_version}}admin_password_version              = {{{admin_password_version}}}{{/admin_password_version}}
  {{#admin_ssh_keys}}admin_ssh_keys                      = {{{admin_ssh_keys}}}{{/admin_ssh_keys}}
  {{#automatic_instance_repair}}automatic_instance_repair           = {{{automatic_instance_repair}}}{{/automatic_instance_repair}}
  {{#boot_diagnostics}}boot_diagnostics                    = {{{boot_diagnostics}}}{{/boot_diagnostics}}
  {{#capacity_reservation_group_id}}capacity_reservation_group_id       = {{{capacity_reservation_group_id}}}{{/capacity_reservation_group_id}}
  {{#custom_data}}custom_data                         = {{{custom_data}}}{{/custom_data}}
  {{#custom_data_version}}custom_data_version                 = {{{custom_data_version}}}{{/custom_data_version}}
  {{#data_disk}}data_disk                           = {{{data_disk}}}{{/data_disk}}
  {{#disk_controller_type}}disk_controller_type                = {{{disk_controller_type}}}{{/disk_controller_type}}
  {{#enable_telemetry}}enable_telemetry                    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#encryption_at_host_enabled}}encryption_at_host_enabled          = {{{encryption_at_host_enabled}}}{{/encryption_at_host_enabled}}
  {{#eviction_policy}}eviction_policy                     = {{{eviction_policy}}}{{/eviction_policy}}
  {{#extension}}extension                           = {{{extension}}}{{/extension}}
  {{#extension_operations_enabled}}extension_operations_enabled        = {{{extension_operations_enabled}}}{{/extension_operations_enabled}}
  {{#extension_protected_setting_version}}extension_protected_setting_version = {{{extension_protected_setting_version}}}{{/extension_protected_setting_version}}
  {{#extensions_time_budget}}extensions_time_budget              = {{{extensions_time_budget}}}{{/extensions_time_budget}}
  {{#instances}}instances                           = {{{instances}}}{{/instances}}
  {{#license_type}}license_type                        = {{{license_type}}}{{/license_type}}
  {{#lock}}lock                                = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                  = {{{managed_identities}}}{{/managed_identities}}
  {{#max_bid_price}}max_bid_price                       = {{{max_bid_price}}}{{/max_bid_price}}
  {{#network_api_version}}network_api_version                 = {{{network_api_version}}}{{/network_api_version}}
  {{#network_interface}}network_interface                   = {{{network_interface}}}{{/network_interface}}
  {{#os_disk}}os_disk                             = {{{os_disk}}}{{/os_disk}}
  {{#os_profile}}os_profile                          = {{{os_profile}}}{{/os_profile}}
  {{#plan}}plan                                = {{{plan}}}{{/plan}}
  {{#platform_fault_domain_count}}platform_fault_domain_count         = {{{platform_fault_domain_count}}}{{/platform_fault_domain_count}}
  {{#priority}}priority                            = {{{priority}}}{{/priority}}
  {{#priority_mix}}priority_mix                        = {{{priority_mix}}}{{/priority_mix}}
  {{#proximity_placement_group_id}}proximity_placement_group_id        = {{{proximity_placement_group_id}}}{{/proximity_placement_group_id}}
  {{#role_assignments}}role_assignments                    = {{{role_assignments}}}{{/role_assignments}}
  {{#single_placement_group}}single_placement_group              = {{{single_placement_group}}}{{/single_placement_group}}
  {{#sku_name}}sku_name                            = {{{sku_name}}}{{/sku_name}}
  {{#source_image_id}}source_image_id                     = {{{source_image_id}}}{{/source_image_id}}
  {{#source_image_reference}}source_image_reference              = {{{source_image_reference}}}{{/source_image_reference}}
  {{#tags}}tags                                = {{{tags}}}{{/tags}}
  {{#termination_notification}}termination_notification            = {{{termination_notification}}}{{/termination_notification}}
  {{#timeouts}}timeouts                            = {{{timeouts}}}{{/timeouts}}
  {{#upgrade_policy}}upgrade_policy                      = {{{upgrade_policy}}}{{/upgrade_policy}}
  {{#user_data_base64_version}}user_data_base64_version            = {{{user_data_base64_version}}}{{/user_data_base64_version}}
  {{#zone_balance}}zone_balance                        = {{{zone_balance}}}{{/zone_balance}}
  {{#zones}}zones                               = {{{zones}}}{{/zones}}
}
