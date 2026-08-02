terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-diskencryptionset" {
  source  = "Azure/avm-res-compute-diskencryptionset/azurerm"
  version = "0.1.1"

  {{#key_vault_key_id}}key_vault_key_id                  = {{{key_vault_key_id}}}{{/key_vault_key_id}}
  {{#key_vault_resource_id}}key_vault_resource_id             = {{{key_vault_resource_id}}}{{/key_vault_resource_id}}
  {{#location}}location                          = {{{location}}}{{/location}}
  {{#name}}name                              = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name               = {{{resource_group_name}}}{{/resource_group_name}}
  {{#auto_key_rotation_enabled}}auto_key_rotation_enabled         = {{{auto_key_rotation_enabled}}}{{/auto_key_rotation_enabled}}
  {{#enable_telemetry}}enable_telemetry                  = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#encryption_type}}encryption_type                   = {{{encryption_type}}}{{/encryption_type}}
  {{#federated_client_id}}federated_client_id               = {{{federated_client_id}}}{{/federated_client_id}}
  {{#key_vault_role_assignment_enabled}}key_vault_role_assignment_enabled = {{{key_vault_role_assignment_enabled}}}{{/key_vault_role_assignment_enabled}}
  {{#lock}}lock                              = {{{lock}}}{{/lock}}
  {{#managed_hsm_key_id}}managed_hsm_key_id                = {{{managed_hsm_key_id}}}{{/managed_hsm_key_id}}
  {{#managed_identities}}managed_identities                = {{{managed_identities}}}{{/managed_identities}}
  {{#tags}}tags                              = {{{tags}}}{{/tags}}
}
