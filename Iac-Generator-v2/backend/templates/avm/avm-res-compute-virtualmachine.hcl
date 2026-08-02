terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-virtualmachine" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "0.21.0"

  {{#location}}location                                               = {{{location}}}{{/location}}
  {{#name}}name                                                   = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                                    = {{{resource_group_name}}}{{/resource_group_name}}
  {{#zone}}zone                                                   = {{{zone}}}{{/zone}}
  {{#account_credentials}}account_credentials                                    = {{{account_credentials}}}{{/account_credentials}}
  {{#additional_unattend_contents}}additional_unattend_contents                           = {{{additional_unattend_contents}}}{{/additional_unattend_contents}}
  {{#admin_password}}admin_password                                         = {{{admin_password}}}{{/admin_password}}
  {{#admin_ssh_keys}}admin_ssh_keys                                         = {{{admin_ssh_keys}}}{{/admin_ssh_keys}}
  {{#admin_username}}admin_username                                         = {{{admin_username}}}{{/admin_username}}
  {{#allow_extension_operations}}allow_extension_operations                             = {{{allow_extension_operations}}}{{/allow_extension_operations}}
  {{#availability_set_resource_id}}availability_set_resource_id                           = {{{availability_set_resource_id}}}{{/availability_set_resource_id}}
  {{#azure_backup_configurations}}azure_backup_configurations                            = {{{azure_backup_configurations}}}{{/azure_backup_configurations}}
  {{#boot_diagnostics}}boot_diagnostics                                       = {{{boot_diagnostics}}}{{/boot_diagnostics}}
  {{#boot_diagnostics_storage_account_uri}}boot_diagnostics_storage_account_uri                   = {{{boot_diagnostics_storage_account_uri}}}{{/boot_diagnostics_storage_account_uri}}
  {{#bypass_platform_safety_checks_on_user_schedule_enabled}}bypass_platform_safety_checks_on_user_schedule_enabled = {{{bypass_platform_safety_checks_on_user_schedule_enabled}}}{{/bypass_platform_safety_checks_on_user_schedule_enabled}}
  {{#capacity_reservation_group_resource_id}}capacity_reservation_group_resource_id                 = {{{capacity_reservation_group_resource_id}}}{{/capacity_reservation_group_resource_id}}
  {{#computer_name}}computer_name                                          = {{{computer_name}}}{{/computer_name}}
  {{#custom_data}}custom_data                                            = {{{custom_data}}}{{/custom_data}}
  {{#data_disk_existing_disks}}data_disk_existing_disks                               = {{{data_disk_existing_disks}}}{{/data_disk_existing_disks}}
  {{#data_disk_managed_disks}}data_disk_managed_disks                                = {{{data_disk_managed_disks}}}{{/data_disk_managed_disks}}
  {{#dedicated_host_group_resource_id}}dedicated_host_group_resource_id                       = {{{dedicated_host_group_resource_id}}}{{/dedicated_host_group_resource_id}}
  {{#dedicated_host_resource_id}}dedicated_host_resource_id                             = {{{dedicated_host_resource_id}}}{{/dedicated_host_resource_id}}
  {{#diagnostic_settings}}diagnostic_settings                                    = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#disable_password_authentication}}disable_password_authentication                        = {{{disable_password_authentication}}}{{/disable_password_authentication}}
  {{#disk_controller_type}}disk_controller_type                                   = {{{disk_controller_type}}}{{/disk_controller_type}}
  {{#edge_zone}}edge_zone                                              = {{{edge_zone}}}{{/edge_zone}}
  {{#enable_automatic_updates}}enable_automatic_updates                               = {{{enable_automatic_updates}}}{{/enable_automatic_updates}}
  {{#enable_telemetry}}enable_telemetry                                       = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#encryption_at_host_enabled}}encryption_at_host_enabled                             = {{{encryption_at_host_enabled}}}{{/encryption_at_host_enabled}}
  {{#eviction_policy}}eviction_policy                                        = {{{eviction_policy}}}{{/eviction_policy}}
  {{#extensions}}extensions                                             = {{{extensions}}}{{/extensions}}
  {{#extensions_time_budget}}extensions_time_budget                                 = {{{extensions_time_budget}}}{{/extensions_time_budget}}
  {{#gallery_applications}}gallery_applications                                   = {{{gallery_applications}}}{{/gallery_applications}}
  {{#generate_admin_password_or_ssh_key}}generate_admin_password_or_ssh_key                     = {{{generate_admin_password_or_ssh_key}}}{{/generate_admin_password_or_ssh_key}}
  {{#generated_secrets_key_vault_secret_config}}generated_secrets_key_vault_secret_config              = {{{generated_secrets_key_vault_secret_config}}}{{/generated_secrets_key_vault_secret_config}}
  {{#hotpatching_enabled}}hotpatching_enabled                                    = {{{hotpatching_enabled}}}{{/hotpatching_enabled}}
  {{#license_type}}license_type                                           = {{{license_type}}}{{/license_type}}
  {{#lock}}lock                                                   = {{{lock}}}{{/lock}}
  {{#maintenance_configuration_resource_ids}}maintenance_configuration_resource_ids                 = {{{maintenance_configuration_resource_ids}}}{{/maintenance_configuration_resource_ids}}
  {{#managed_identities}}managed_identities                                     = {{{managed_identities}}}{{/managed_identities}}
  {{#max_bid_price}}max_bid_price                                          = {{{max_bid_price}}}{{/max_bid_price}}
  {{#network_interfaces}}network_interfaces                                     = {{{network_interfaces}}}{{/network_interfaces}}
  {{#os_disk}}os_disk                                                = {{{os_disk}}}{{/os_disk}}
  {{#os_disk_attach_mode}}os_disk_attach_mode                                    = {{{os_disk_attach_mode}}}{{/os_disk_attach_mode}}
  {{#os_managed_disk_id}}os_managed_disk_id                                     = {{{os_managed_disk_id}}}{{/os_managed_disk_id}}
  {{#os_type}}os_type                                                = {{{os_type}}}{{/os_type}}
  {{#patch_assessment_mode}}patch_assessment_mode                                  = {{{patch_assessment_mode}}}{{/patch_assessment_mode}}
  {{#patch_mode}}patch_mode                                             = {{{patch_mode}}}{{/patch_mode}}
  {{#plan}}plan                                                   = {{{plan}}}{{/plan}}
  {{#platform_fault_domain}}platform_fault_domain                                  = {{{platform_fault_domain}}}{{/platform_fault_domain}}
  {{#priority}}priority                                               = {{{priority}}}{{/priority}}
  {{#provision_vm_agent}}provision_vm_agent                                     = {{{provision_vm_agent}}}{{/provision_vm_agent}}
  {{#proximity_placement_group_resource_id}}proximity_placement_group_resource_id                  = {{{proximity_placement_group_resource_id}}}{{/proximity_placement_group_resource_id}}
  {{#public_ip_configuration_details}}public_ip_configuration_details                        = {{{public_ip_configuration_details}}}{{/public_ip_configuration_details}}
  {{#reboot_setting}}reboot_setting                                         = {{{reboot_setting}}}{{/reboot_setting}}
  {{#role_assignments}}role_assignments                                       = {{{role_assignments}}}{{/role_assignments}}
  {{#role_assignments_system_managed_identity}}role_assignments_system_managed_identity               = {{{role_assignments_system_managed_identity}}}{{/role_assignments_system_managed_identity}}
  {{#run_commands}}run_commands                                           = {{{run_commands}}}{{/run_commands}}
  {{#run_commands_secrets}}run_commands_secrets                                   = {{{run_commands_secrets}}}{{/run_commands_secrets}}
  {{#secrets}}secrets                                                = {{{secrets}}}{{/secrets}}
  {{#secure_boot_enabled}}secure_boot_enabled                                    = {{{secure_boot_enabled}}}{{/secure_boot_enabled}}
  {{#shutdown_schedules}}shutdown_schedules                                     = {{{shutdown_schedules}}}{{/shutdown_schedules}}
  {{#sku_size}}sku_size                                               = {{{sku_size}}}{{/sku_size}}
  {{#source_image_reference}}source_image_reference                                 = {{{source_image_reference}}}{{/source_image_reference}}
  {{#source_image_resource_id}}source_image_resource_id                               = {{{source_image_resource_id}}}{{/source_image_resource_id}}
  {{#tags}}tags                                                   = {{{tags}}}{{/tags}}
  {{#termination_notification}}termination_notification                               = {{{termination_notification}}}{{/termination_notification}}
  {{#timeouts}}timeouts                                               = {{{timeouts}}}{{/timeouts}}
  {{#timezone}}timezone                                               = {{{timezone}}}{{/timezone}}
  {{#user_data}}user_data                                              = {{{user_data}}}{{/user_data}}
  {{#virtual_machine_scale_set_resource_id}}virtual_machine_scale_set_resource_id                  = {{{virtual_machine_scale_set_resource_id}}}{{/virtual_machine_scale_set_resource_id}}
  {{#vm_additional_capabilities}}vm_additional_capabilities                             = {{{vm_additional_capabilities}}}{{/vm_additional_capabilities}}
  {{#vtpm_enabled}}vtpm_enabled                                           = {{{vtpm_enabled}}}{{/vtpm_enabled}}
  {{#winrm_listeners}}winrm_listeners                                        = {{{winrm_listeners}}}{{/winrm_listeners}}
}
