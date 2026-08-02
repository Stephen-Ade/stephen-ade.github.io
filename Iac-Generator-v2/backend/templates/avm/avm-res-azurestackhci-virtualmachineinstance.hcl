terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-azurestackhci-virtualmachineinstance" {
  source  = "Azure/avm-res-azurestackhci-virtualmachineinstance/azurerm"
  version = "2.1.1"

  {{#admin_password}}admin_password             = {{{admin_password}}}{{/admin_password}}
  {{#admin_username}}admin_username             = {{{admin_username}}}{{/admin_username}}
  {{#custom_location_id}}custom_location_id         = {{{custom_location_id}}}{{/custom_location_id}}
  {{#image_id}}image_id                   = {{{image_id}}}{{/image_id}}
  {{#location}}location                   = {{{location}}}{{/location}}
  {{#logical_network_id}}logical_network_id         = {{{logical_network_id}}}{{/logical_network_id}}
  {{#name}}name                       = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name        = {{{resource_group_name}}}{{/resource_group_name}}
  {{#auto_upgrade_minor_version}}auto_upgrade_minor_version = {{{auto_upgrade_minor_version}}}{{/auto_upgrade_minor_version}}
  {{#data_disk_params}}data_disk_params           = {{{data_disk_params}}}{{/data_disk_params}}
  {{#domain_join_extension_tags}}domain_join_extension_tags = {{{domain_join_extension_tags}}}{{/domain_join_extension_tags}}
  {{#domain_join_password}}domain_join_password       = {{{domain_join_password}}}{{/domain_join_password}}
  {{#domain_join_user_name}}domain_join_user_name      = {{{domain_join_user_name}}}{{/domain_join_user_name}}
  {{#domain_target_ou}}domain_target_ou           = {{{domain_target_ou}}}{{/domain_target_ou}}
  {{#domain_to_join}}domain_to_join             = {{{domain_to_join}}}{{/domain_to_join}}
  {{#dynamic_memory}}dynamic_memory             = {{{dynamic_memory}}}{{/dynamic_memory}}
  {{#dynamic_memory_buffer}}dynamic_memory_buffer      = {{{dynamic_memory_buffer}}}{{/dynamic_memory_buffer}}
  {{#dynamic_memory_max}}dynamic_memory_max         = {{{dynamic_memory_max}}}{{/dynamic_memory_max}}
  {{#dynamic_memory_min}}dynamic_memory_min         = {{{dynamic_memory_min}}}{{/dynamic_memory_min}}
  {{#enable_telemetry}}enable_telemetry           = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#enable_tpm}}enable_tpm                 = {{{enable_tpm}}}{{/enable_tpm}}
  {{#http_proxy}}http_proxy                 = {{{http_proxy}}}{{/http_proxy}}
  {{#https_proxy}}https_proxy                = {{{https_proxy}}}{{/https_proxy}}
  {{#linux_ssh_config}}linux_ssh_config           = {{{linux_ssh_config}}}{{/linux_ssh_config}}
  {{#lock}}lock                       = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities         = {{{managed_identities}}}{{/managed_identities}}
  {{#memory_mb}}memory_mb                  = {{{memory_mb}}}{{/memory_mb}}
  {{#nic_tags}}nic_tags                   = {{{nic_tags}}}{{/nic_tags}}
  {{#no_proxy}}no_proxy                   = {{{no_proxy}}}{{/no_proxy}}
  {{#os_type}}os_type                    = {{{os_type}}}{{/os_type}}
  {{#private_ip_address}}private_ip_address         = {{{private_ip_address}}}{{/private_ip_address}}
  {{#role_assignments}}role_assignments           = {{{role_assignments}}}{{/role_assignments}}
  {{#secure_boot_enabled}}secure_boot_enabled        = {{{secure_boot_enabled}}}{{/secure_boot_enabled}}
  {{#security_type}}security_type              = {{{security_type}}}{{/security_type}}
  {{#tags}}tags                       = {{{tags}}}{{/tags}}
  {{#trusted_ca}}trusted_ca                 = {{{trusted_ca}}}{{/trusted_ca}}
  {{#type_handler_version}}type_handler_version       = {{{type_handler_version}}}{{/type_handler_version}}
  {{#user_storage_id}}user_storage_id            = {{{user_storage_id}}}{{/user_storage_id}}
  {{#v_cpu_count}}v_cpu_count                = {{{v_cpu_count}}}{{/v_cpu_count}}
  {{#windows_ssh_config}}windows_ssh_config         = {{{windows_ssh_config}}}{{/windows_ssh_config}}
}
