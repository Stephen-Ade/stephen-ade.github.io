terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-sqlvirtualmachine-sqlvirtualmachine" {
  source  = "Azure/avm-res-sqlvirtualmachine-sqlvirtualmachine/azurerm"
  version = "0.0.1"

  {{#location}}location                                  = {{{location}}}{{/location}}
  {{#name}}name                                      = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                       = {{{resource_group_name}}}{{/resource_group_name}}
  {{#virtual_machine_resource_id}}virtual_machine_resource_id               = {{{virtual_machine_resource_id}}}{{/virtual_machine_resource_id}}
  {{#assessment_settings}}assessment_settings                       = {{{assessment_settings}}}{{/assessment_settings}}
  {{#auto_backup_settings}}auto_backup_settings                      = {{{auto_backup_settings}}}{{/auto_backup_settings}}
  {{#auto_patching_settings}}auto_patching_settings                    = {{{auto_patching_settings}}}{{/auto_patching_settings}}
  {{#automatic_upgrade_enabled}}automatic_upgrade_enabled                 = {{{automatic_upgrade_enabled}}}{{/automatic_upgrade_enabled}}
  {{#enable_telemetry}}enable_telemetry                          = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#key_vault_credential_settings}}key_vault_credential_settings             = {{{key_vault_credential_settings}}}{{/key_vault_credential_settings}}
  {{#least_privilege_mode}}least_privilege_mode                      = {{{least_privilege_mode}}}{{/least_privilege_mode}}
  {{#lock}}lock                                      = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                        = {{{managed_identities}}}{{/managed_identities}}
  {{#role_assignments}}role_assignments                          = {{{role_assignments}}}{{/role_assignments}}
  {{#server_configurations_management_settings}}server_configurations_management_settings = {{{server_configurations_management_settings}}}{{/server_configurations_management_settings}}
  {{#sql_image_offer}}sql_image_offer                           = {{{sql_image_offer}}}{{/sql_image_offer}}
  {{#sql_image_sku}}sql_image_sku                             = {{{sql_image_sku}}}{{/sql_image_sku}}
  {{#sql_management}}sql_management                            = {{{sql_management}}}{{/sql_management}}
  {{#sql_server_license_type}}sql_server_license_type                   = {{{sql_server_license_type}}}{{/sql_server_license_type}}
  {{#sql_virtual_machine_group_resource_id}}sql_virtual_machine_group_resource_id     = {{{sql_virtual_machine_group_resource_id}}}{{/sql_virtual_machine_group_resource_id}}
  {{#storage_configuration_settings}}storage_configuration_settings            = {{{storage_configuration_settings}}}{{/storage_configuration_settings}}
  {{#tags}}tags                                      = {{{tags}}}{{/tags}}
  {{#virtual_machine_identity_settings}}virtual_machine_identity_settings         = {{{virtual_machine_identity_settings}}}{{/virtual_machine_identity_settings}}
  {{#wsfc_domain_credentials}}wsfc_domain_credentials                   = {{{wsfc_domain_credentials}}}{{/wsfc_domain_credentials}}
  {{#wsfc_static_ip}}wsfc_static_ip                            = {{{wsfc_static_ip}}}{{/wsfc_static_ip}}
}
