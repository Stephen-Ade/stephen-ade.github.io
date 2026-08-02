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

  {{#if extension_protected_setting}}extension_protected_setting         = {{hclVal extension_protected_setting}}{{/if}}
  {{#if location}}location                            = {{hclVal location}}{{/if}}
  {{#if name}}name                                = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                           = {{hclVal parent_id}}{{/if}}
  {{#if user_data_base64}}user_data_base64                    = {{hclVal user_data_base64}}{{/if}}
  {{#if additional_capabilities}}additional_capabilities             = {{hclVal additional_capabilities}}{{/if}}
  {{#if admin_password}}admin_password                      = {{hclVal admin_password}}{{/if}}
  {{#if admin_password_version}}admin_password_version              = {{hclVal admin_password_version}}{{/if}}
  {{#if admin_ssh_keys}}admin_ssh_keys                      = {{hclVal admin_ssh_keys}}{{/if}}
  {{#if automatic_instance_repair}}automatic_instance_repair           = {{hclVal automatic_instance_repair}}{{/if}}
  {{#if boot_diagnostics}}boot_diagnostics                    = {{hclVal boot_diagnostics}}{{/if}}
  {{#if capacity_reservation_group_id}}capacity_reservation_group_id       = {{hclVal capacity_reservation_group_id}}{{/if}}
  {{#if custom_data}}custom_data                         = {{hclVal custom_data}}{{/if}}
  {{#if custom_data_version}}custom_data_version                 = {{hclVal custom_data_version}}{{/if}}
  {{#if data_disk}}data_disk                           = {{hclVal data_disk}}{{/if}}
  {{#if disk_controller_type}}disk_controller_type                = {{hclVal disk_controller_type}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                    = {{hclVal enable_telemetry}}{{/if}}
  {{#if encryption_at_host_enabled}}encryption_at_host_enabled          = {{hclVal encryption_at_host_enabled}}{{/if}}
  {{#if eviction_policy}}eviction_policy                     = {{hclVal eviction_policy}}{{/if}}
  {{#if extension}}extension                           = {{hclVal extension}}{{/if}}
  {{#if extension_operations_enabled}}extension_operations_enabled        = {{hclVal extension_operations_enabled}}{{/if}}
  {{#if extension_protected_setting_version}}extension_protected_setting_version = {{hclVal extension_protected_setting_version}}{{/if}}
  {{#if extensions_time_budget}}extensions_time_budget              = {{hclVal extensions_time_budget}}{{/if}}
  {{#if instances}}instances                           = {{hclVal instances}}{{/if}}
  {{#if license_type}}license_type                        = {{hclVal license_type}}{{/if}}
  {{#if lock}}lock                                = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                  = {{hclVal managed_identities}}{{/if}}
  {{#if max_bid_price}}max_bid_price                       = {{hclVal max_bid_price}}{{/if}}
  {{#if network_api_version}}network_api_version                 = {{hclVal network_api_version}}{{/if}}
  {{#if network_interface}}network_interface                   = {{hclVal network_interface}}{{/if}}
  {{#if os_disk}}os_disk                             = {{hclVal os_disk}}{{/if}}
  {{#if os_profile}}os_profile                          = {{hclVal os_profile}}{{/if}}
  {{#if plan}}plan                                = {{hclVal plan}}{{/if}}
  {{#if platform_fault_domain_count}}platform_fault_domain_count         = {{hclVal platform_fault_domain_count}}{{/if}}
  {{#if priority}}priority                            = {{hclVal priority}}{{/if}}
  {{#if priority_mix}}priority_mix                        = {{hclVal priority_mix}}{{/if}}
  {{#if proximity_placement_group_id}}proximity_placement_group_id        = {{hclVal proximity_placement_group_id}}{{/if}}
  {{#if role_assignments}}role_assignments                    = {{hclVal role_assignments}}{{/if}}
  {{#if single_placement_group}}single_placement_group              = {{hclVal single_placement_group}}{{/if}}
  {{#if sku_name}}sku_name                            = {{hclVal sku_name}}{{/if}}
  {{#if source_image_id}}source_image_id                     = {{hclVal source_image_id}}{{/if}}
  {{#if source_image_reference}}source_image_reference              = {{hclVal source_image_reference}}{{/if}}
  {{#if tags}}tags                                = {{hclVal tags}}{{/if}}
  {{#if termination_notification}}termination_notification            = {{hclVal termination_notification}}{{/if}}
  {{#if timeouts}}timeouts                            = {{hclVal timeouts}}{{/if}}
  {{#if upgrade_policy}}upgrade_policy                      = {{hclVal upgrade_policy}}{{/if}}
  {{#if user_data_base64_version}}user_data_base64_version            = {{hclVal user_data_base64_version}}{{/if}}
  {{#if zone_balance}}zone_balance                        = {{hclVal zone_balance}}{{/if}}
  {{#if zones}}zones                               = {{hclVal zones}}{{/if}}
}
