terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_netapp_netappaccount" {
  source  = "Azure/avm-res-netapp-netappaccount/azurerm"
  version = "0.3.0"

  {{#if location}}location                          = {{hclVal location}}{{/if}}
  {{#if name}}name                              = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name               = {{hclVal resource_group_name}}{{/if}}
  {{#if active_directories}}active_directories                = {{hclVal active_directories}}{{/if}}
  {{#if backup_policies}}backup_policies                   = {{hclVal backup_policies}}{{/if}}
  {{#if backup_vaults}}backup_vaults                     = {{hclVal backup_vaults}}{{/if}}
  {{#if capacity_pools}}capacity_pools                    = {{hclVal capacity_pools}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                  = {{hclVal enable_telemetry}}{{/if}}
  {{#if inherit_tags_from_parent_resource}}inherit_tags_from_parent_resource = {{hclVal inherit_tags_from_parent_resource}}{{/if}}
  {{#if lock}}lock                              = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                = {{hclVal managed_identities}}{{/if}}
  {{#if role_assignments}}role_assignments                  = {{hclVal role_assignments}}{{/if}}
  {{#if snapshot_policies}}snapshot_policies                 = {{hclVal snapshot_policies}}{{/if}}
  {{#if subscription_id}}subscription_id                   = {{hclVal subscription_id}}{{/if}}
  {{#if tags}}tags                              = {{hclVal tags}}{{/if}}
  {{#if volumes}}volumes                           = {{hclVal volumes}}{{/if}}
}
