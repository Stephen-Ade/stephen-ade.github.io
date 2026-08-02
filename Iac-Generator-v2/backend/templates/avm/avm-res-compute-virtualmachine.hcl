terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_compute_virtualmachine" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "0.21.0"

  {{#if location}}location                                               = {{hclVal location}}{{/if}}
  {{#if name}}name                                                   = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                                    = {{hclVal resource_group_name}}{{/if}}
  {{#if zone}}zone                                                   = {{hclVal zone}}{{/if}}
  {{#if account_credentials}}account_credentials                                    = {{hclVal account_credentials}}{{/if}}
  {{#if additional_unattend_contents}}additional_unattend_contents                           = {{hclVal additional_unattend_contents}}{{/if}}
  {{#if admin_password}}admin_password                                         = {{hclVal admin_password}}{{/if}}
  {{#if admin_ssh_keys}}admin_ssh_keys                                         = {{hclVal admin_ssh_keys}}{{/if}}
  {{#if admin_username}}admin_username                                         = {{hclVal admin_username}}{{/if}}
  {{#if allow_extension_operations}}allow_extension_operations                             = {{hclVal allow_extension_operations}}{{/if}}
  {{#if availability_set_resource_id}}availability_set_resource_id                           = {{hclVal availability_set_resource_id}}{{/if}}
  {{#if azure_backup_configurations}}azure_backup_configurations                            = {{hclVal azure_backup_configurations}}{{/if}}
  {{#if boot_diagnostics}}boot_diagnostics                                       = {{hclVal boot_diagnostics}}{{/if}}
  {{#if boot_diagnostics_storage_account_uri}}boot_diagnostics_storage_account_uri                   = {{hclVal boot_diagnostics_storage_account_uri}}{{/if}}
  {{#if bypass_platform_safety_checks_on_user_schedule_enabled}}bypass_platform_safety_checks_on_user_schedule_enabled = {{hclVal bypass_platform_safety_checks_on_user_schedule_enabled}}{{/if}}
  {{#if capacity_reservation_group_resource_id}}capacity_reservation_group_resource_id                 = {{hclVal capacity_reservation_group_resource_id}}{{/if}}
  {{#if computer_name}}computer_name                                          = {{hclVal computer_name}}{{/if}}
  {{#if custom_data}}custom_data                                            = {{hclVal custom_data}}{{/if}}
  {{#if data_disk_existing_disks}}data_disk_existing_disks                               = {{hclVal data_disk_existing_disks}}{{/if}}
  {{#if data_disk_managed_disks}}data_disk_managed_disks                                = {{hclVal data_disk_managed_disks}}{{/if}}
  {{#if dedicated_host_group_resource_id}}dedicated_host_group_resource_id                       = {{hclVal dedicated_host_group_resource_id}}{{/if}}
  {{#if dedicated_host_resource_id}}dedicated_host_resource_id                             = {{hclVal dedicated_host_resource_id}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                                    = {{hclVal diagnostic_settings}}{{/if}}
  {{#if disable_password_authentication}}disable_password_authentication                        = {{hclVal disable_password_authentication}}{{/if}}
  {{#if disk_controller_type}}disk_controller_type                                   = {{hclVal disk_controller_type}}{{/if}}
  {{#if edge_zone}}edge_zone                                              = {{hclVal edge_zone}}{{/if}}
  {{#if enable_automatic_updates}}enable_automatic_updates                               = {{hclVal enable_automatic_updates}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                       = {{hclVal enable_telemetry}}{{/if}}
  {{#if encryption_at_host_enabled}}encryption_at_host_enabled                             = {{hclVal encryption_at_host_enabled}}{{/if}}
  {{#if eviction_policy}}eviction_policy                                        = {{hclVal eviction_policy}}{{/if}}
  {{#if extensions}}extensions                                             = {{hclVal extensions}}{{/if}}
  {{#if extensions_time_budget}}extensions_time_budget                                 = {{hclVal extensions_time_budget}}{{/if}}
  {{#if gallery_applications}}gallery_applications                                   = {{hclVal gallery_applications}}{{/if}}
  {{#if generate_admin_password_or_ssh_key}}generate_admin_password_or_ssh_key                     = {{hclVal generate_admin_password_or_ssh_key}}{{/if}}
  {{#if generated_secrets_key_vault_secret_config}}generated_secrets_key_vault_secret_config              = {{hclVal generated_secrets_key_vault_secret_config}}{{/if}}
  {{#if hotpatching_enabled}}hotpatching_enabled                                    = {{hclVal hotpatching_enabled}}{{/if}}
  {{#if license_type}}license_type                                           = {{hclVal license_type}}{{/if}}
  {{#if lock}}lock                                                   = {{hclVal lock}}{{/if}}
  {{#if maintenance_configuration_resource_ids}}maintenance_configuration_resource_ids                 = {{hclVal maintenance_configuration_resource_ids}}{{/if}}
  {{#if managed_identities}}managed_identities                                     = {{hclVal managed_identities}}{{/if}}
  {{#if max_bid_price}}max_bid_price                                          = {{hclVal max_bid_price}}{{/if}}
  {{#if network_interfaces}}network_interfaces                                     = {{hclVal network_interfaces}}{{/if}}
  {{#if os_disk}}os_disk                                                = {{hclVal os_disk}}{{/if}}
  {{#if os_disk_attach_mode}}os_disk_attach_mode                                    = {{hclVal os_disk_attach_mode}}{{/if}}
  {{#if os_managed_disk_id}}os_managed_disk_id                                     = {{hclVal os_managed_disk_id}}{{/if}}
  {{#if os_type}}os_type                                                = {{hclVal os_type}}{{/if}}
  {{#if patch_assessment_mode}}patch_assessment_mode                                  = {{hclVal patch_assessment_mode}}{{/if}}
  {{#if patch_mode}}patch_mode                                             = {{hclVal patch_mode}}{{/if}}
  {{#if plan}}plan                                                   = {{hclVal plan}}{{/if}}
  {{#if platform_fault_domain}}platform_fault_domain                                  = {{hclVal platform_fault_domain}}{{/if}}
  {{#if priority}}priority                                               = {{hclVal priority}}{{/if}}
  {{#if provision_vm_agent}}provision_vm_agent                                     = {{hclVal provision_vm_agent}}{{/if}}
  {{#if proximity_placement_group_resource_id}}proximity_placement_group_resource_id                  = {{hclVal proximity_placement_group_resource_id}}{{/if}}
  {{#if public_ip_configuration_details}}public_ip_configuration_details                        = {{hclVal public_ip_configuration_details}}{{/if}}
  {{#if reboot_setting}}reboot_setting                                         = {{hclVal reboot_setting}}{{/if}}
  {{#if role_assignments}}role_assignments                                       = {{hclVal role_assignments}}{{/if}}
  {{#if role_assignments_system_managed_identity}}role_assignments_system_managed_identity               = {{hclVal role_assignments_system_managed_identity}}{{/if}}
  {{#if run_commands}}run_commands                                           = {{hclVal run_commands}}{{/if}}
  {{#if run_commands_secrets}}run_commands_secrets                                   = {{hclVal run_commands_secrets}}{{/if}}
  {{#if secrets}}secrets                                                = {{hclVal secrets}}{{/if}}
  {{#if secure_boot_enabled}}secure_boot_enabled                                    = {{hclVal secure_boot_enabled}}{{/if}}
  {{#if shutdown_schedules}}shutdown_schedules                                     = {{hclVal shutdown_schedules}}{{/if}}
  {{#if sku_size}}sku_size                                               = {{hclVal sku_size}}{{/if}}
  {{#if source_image_reference}}source_image_reference                                 = {{hclVal source_image_reference}}{{/if}}
  {{#if source_image_resource_id}}source_image_resource_id                               = {{hclVal source_image_resource_id}}{{/if}}
  {{#if tags}}tags                                                   = {{hclVal tags}}{{/if}}
  {{#if termination_notification}}termination_notification                               = {{hclVal termination_notification}}{{/if}}
  {{#if timezone}}timezone                                               = {{hclVal timezone}}{{/if}}
  {{#if user_data}}user_data                                              = {{hclVal user_data}}{{/if}}
  {{#if virtual_machine_scale_set_resource_id}}virtual_machine_scale_set_resource_id                  = {{hclVal virtual_machine_scale_set_resource_id}}{{/if}}
  {{#if vm_additional_capabilities}}vm_additional_capabilities                             = {{hclVal vm_additional_capabilities}}{{/if}}
  {{#if vtpm_enabled}}vtpm_enabled                                           = {{hclVal vtpm_enabled}}{{/if}}
  {{#if winrm_listeners}}winrm_listeners                                        = {{hclVal winrm_listeners}}{{/if}}
}
