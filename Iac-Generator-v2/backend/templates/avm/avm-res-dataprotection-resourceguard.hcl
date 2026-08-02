terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_dataprotection_resourceguard" {
  source  = "Azure/avm-res-dataprotection-resourceguard/azurerm"
  version = "0.1.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_id}}resource_group_id                       = {{hclVal resource_group_id}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if vault_critical_operation_exclusion_list}}vault_critical_operation_exclusion_list = {{hclVal vault_critical_operation_exclusion_list}}{{/if}}
}
