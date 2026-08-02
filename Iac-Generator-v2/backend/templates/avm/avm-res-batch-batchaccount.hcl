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

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if storage_account_id}}storage_account_id                      = {{hclVal storage_account_id}}{{/if}}
  {{#if allowed_authentication_modes}}allowed_authentication_modes            = {{hclVal allowed_authentication_modes}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if encryption}}encryption                              = {{hclVal encryption}}{{/if}}
  {{#if identity}}identity                                = {{hclVal identity}}{{/if}}
  {{#if key_vault_reference}}key_vault_reference                     = {{hclVal key_vault_reference}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if network_profile}}network_profile                         = {{hclVal network_profile}}{{/if}}
  {{#if pool_allocation_mode}}pool_allocation_mode                    = {{hclVal pool_allocation_mode}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if storage_account_authentication_mode}}storage_account_authentication_mode     = {{hclVal storage_account_authentication_mode}}{{/if}}
  {{#if storage_account_node_identity}}storage_account_node_identity           = {{hclVal storage_account_node_identity}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
}
