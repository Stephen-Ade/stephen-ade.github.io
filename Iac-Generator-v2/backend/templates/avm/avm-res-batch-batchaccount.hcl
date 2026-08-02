terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-batch-batchaccount" {
  source  = "Azure/avm-res-batch-batchaccount/azurerm"
  version = "0.2.0"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#storage_account_id}}storage_account_id                      = {{{storage_account_id}}}{{/storage_account_id}}
  {{#allowed_authentication_modes}}allowed_authentication_modes            = {{{allowed_authentication_modes}}}{{/allowed_authentication_modes}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#encryption}}encryption                              = {{{encryption}}}{{/encryption}}
  {{#identity}}identity                                = {{{identity}}}{{/identity}}
  {{#key_vault_reference}}key_vault_reference                     = {{{key_vault_reference}}}{{/key_vault_reference}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#network_profile}}network_profile                         = {{{network_profile}}}{{/network_profile}}
  {{#pool_allocation_mode}}pool_allocation_mode                    = {{{pool_allocation_mode}}}{{/pool_allocation_mode}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#storage_account_authentication_mode}}storage_account_authentication_mode     = {{{storage_account_authentication_mode}}}{{/storage_account_authentication_mode}}
  {{#storage_account_node_identity}}storage_account_node_identity           = {{{storage_account_node_identity}}}{{/storage_account_node_identity}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
}
