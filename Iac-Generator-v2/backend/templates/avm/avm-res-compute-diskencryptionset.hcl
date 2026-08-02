terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_compute_diskencryptionset" {
  source  = "Azure/avm-res-compute-diskencryptionset/azurerm"
  version = "0.1.1"

  {{#if key_vault_key_id}}key_vault_key_id                  = {{hclVal key_vault_key_id}}{{/if}}
  {{#if key_vault_resource_id}}key_vault_resource_id             = {{hclVal key_vault_resource_id}}{{/if}}
  {{#if location}}location                          = {{hclVal location}}{{/if}}
  {{#if name}}name                              = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name               = {{hclVal resource_group_name}}{{/if}}
  {{#if auto_key_rotation_enabled}}auto_key_rotation_enabled         = {{hclVal auto_key_rotation_enabled}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                  = {{hclVal enable_telemetry}}{{/if}}
  {{#if encryption_type}}encryption_type                   = {{hclVal encryption_type}}{{/if}}
  {{#if federated_client_id}}federated_client_id               = {{hclVal federated_client_id}}{{/if}}
  {{#if key_vault_role_assignment_enabled}}key_vault_role_assignment_enabled = {{hclVal key_vault_role_assignment_enabled}}{{/if}}
  {{#if lock}}lock                              = {{hclVal lock}}{{/if}}
  {{#if managed_hsm_key_id}}managed_hsm_key_id                = {{hclVal managed_hsm_key_id}}{{/if}}
  {{#if managed_identities}}managed_identities                = {{hclVal managed_identities}}{{/if}}
  {{#if tags}}tags                              = {{hclVal tags}}{{/if}}
}
