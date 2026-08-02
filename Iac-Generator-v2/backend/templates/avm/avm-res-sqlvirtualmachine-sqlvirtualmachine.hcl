terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_sqlvirtualmachine_sqlvirtualmachine" {
  source  = "Azure/avm-res-sqlvirtualmachine-sqlvirtualmachine/azurerm"
  version = "0.0.1"

  {{#if location}}location                                  = {{hclVal location}}{{/if}}
  {{#if name}}name                                      = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                       = {{hclVal resource_group_name}}{{/if}}
  {{#if virtual_machine_resource_id}}virtual_machine_resource_id               = {{hclVal virtual_machine_resource_id}}{{/if}}
  {{#if assessment_settings}}assessment_settings                       = {{hclVal assessment_settings}}{{/if}}
  {{#if auto_backup_settings}}auto_backup_settings                      = {{hclVal auto_backup_settings}}{{/if}}
  {{#if auto_patching_settings}}auto_patching_settings                    = {{hclVal auto_patching_settings}}{{/if}}
  {{#if automatic_upgrade_enabled}}automatic_upgrade_enabled                 = {{hclVal automatic_upgrade_enabled}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                          = {{hclVal enable_telemetry}}{{/if}}
  {{#if key_vault_credential_settings}}key_vault_credential_settings             = {{hclVal key_vault_credential_settings}}{{/if}}
  {{#if least_privilege_mode}}least_privilege_mode                      = {{hclVal least_privilege_mode}}{{/if}}
  {{#if lock}}lock                                      = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                        = {{hclVal managed_identities}}{{/if}}
  {{#if role_assignments}}role_assignments                          = {{hclVal role_assignments}}{{/if}}
  {{#if server_configurations_management_settings}}server_configurations_management_settings = {{hclVal server_configurations_management_settings}}{{/if}}
  {{#if sql_image_offer}}sql_image_offer                           = {{hclVal sql_image_offer}}{{/if}}
  {{#if sql_image_sku}}sql_image_sku                             = {{hclVal sql_image_sku}}{{/if}}
  {{#if sql_management}}sql_management                            = {{hclVal sql_management}}{{/if}}
  {{#if sql_server_license_type}}sql_server_license_type                   = {{hclVal sql_server_license_type}}{{/if}}
  {{#if sql_virtual_machine_group_resource_id}}sql_virtual_machine_group_resource_id     = {{hclVal sql_virtual_machine_group_resource_id}}{{/if}}
  {{#if storage_configuration_settings}}storage_configuration_settings            = {{hclVal storage_configuration_settings}}{{/if}}
  {{#if tags}}tags                                      = {{hclVal tags}}{{/if}}
  {{#if virtual_machine_identity_settings}}virtual_machine_identity_settings         = {{hclVal virtual_machine_identity_settings}}{{/if}}
  {{#if wsfc_domain_credentials}}wsfc_domain_credentials                   = {{hclVal wsfc_domain_credentials}}{{/if}}
  {{#if wsfc_static_ip}}wsfc_static_ip                            = {{hclVal wsfc_static_ip}}{{/if}}
}
