terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_azurestackhci_virtualmachineinstance" {
  source  = "Azure/avm-res-azurestackhci-virtualmachineinstance/azurerm"
  version = "2.1.1"

  {{#if admin_password}}admin_password             = {{hclVal admin_password}}{{/if}}
  {{#if admin_username}}admin_username             = {{hclVal admin_username}}{{/if}}
  {{#if custom_location_id}}custom_location_id         = {{hclVal custom_location_id}}{{/if}}
  {{#if image_id}}image_id                   = {{hclVal image_id}}{{/if}}
  {{#if location}}location                   = {{hclVal location}}{{/if}}
  {{#if logical_network_id}}logical_network_id         = {{hclVal logical_network_id}}{{/if}}
  {{#if name}}name                       = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name        = {{hclVal resource_group_name}}{{/if}}
  {{#if auto_upgrade_minor_version}}auto_upgrade_minor_version = {{hclVal auto_upgrade_minor_version}}{{/if}}
  {{#if data_disk_params}}data_disk_params           = {{hclVal data_disk_params}}{{/if}}
  {{#if domain_join_extension_tags}}domain_join_extension_tags = {{hclVal domain_join_extension_tags}}{{/if}}
  {{#if domain_join_password}}domain_join_password       = {{hclVal domain_join_password}}{{/if}}
  {{#if domain_join_user_name}}domain_join_user_name      = {{hclVal domain_join_user_name}}{{/if}}
  {{#if domain_target_ou}}domain_target_ou           = {{hclVal domain_target_ou}}{{/if}}
  {{#if domain_to_join}}domain_to_join             = {{hclVal domain_to_join}}{{/if}}
  {{#if dynamic_memory}}dynamic_memory             = {{hclVal dynamic_memory}}{{/if}}
  {{#if dynamic_memory_buffer}}dynamic_memory_buffer      = {{hclVal dynamic_memory_buffer}}{{/if}}
  {{#if dynamic_memory_max}}dynamic_memory_max         = {{hclVal dynamic_memory_max}}{{/if}}
  {{#if dynamic_memory_min}}dynamic_memory_min         = {{hclVal dynamic_memory_min}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry           = {{hclVal enable_telemetry}}{{/if}}
  {{#if enable_tpm}}enable_tpm                 = {{hclVal enable_tpm}}{{/if}}
  {{#if http_proxy}}http_proxy                 = {{hclVal http_proxy}}{{/if}}
  {{#if https_proxy}}https_proxy                = {{hclVal https_proxy}}{{/if}}
  {{#if linux_ssh_config}}linux_ssh_config           = {{hclVal linux_ssh_config}}{{/if}}
  {{#if lock}}lock                       = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities         = {{hclVal managed_identities}}{{/if}}
  {{#if memory_mb}}memory_mb                  = {{hclVal memory_mb}}{{/if}}
  {{#if nic_tags}}nic_tags                   = {{hclVal nic_tags}}{{/if}}
  {{#if no_proxy}}no_proxy                   = {{hclVal no_proxy}}{{/if}}
  {{#if os_type}}os_type                    = {{hclVal os_type}}{{/if}}
  {{#if private_ip_address}}private_ip_address         = {{hclVal private_ip_address}}{{/if}}
  {{#if role_assignments}}role_assignments           = {{hclVal role_assignments}}{{/if}}
  {{#if secure_boot_enabled}}secure_boot_enabled        = {{hclVal secure_boot_enabled}}{{/if}}
  {{#if security_type}}security_type              = {{hclVal security_type}}{{/if}}
  {{#if tags}}tags                       = {{hclVal tags}}{{/if}}
  {{#if trusted_ca}}trusted_ca                 = {{hclVal trusted_ca}}{{/if}}
  {{#if type_handler_version}}type_handler_version       = {{hclVal type_handler_version}}{{/if}}
  {{#if user_storage_id}}user_storage_id            = {{hclVal user_storage_id}}{{/if}}
  {{#if v_cpu_count}}v_cpu_count                = {{hclVal v_cpu_count}}{{/if}}
  {{#if windows_ssh_config}}windows_ssh_config         = {{hclVal windows_ssh_config}}{{/if}}
}
