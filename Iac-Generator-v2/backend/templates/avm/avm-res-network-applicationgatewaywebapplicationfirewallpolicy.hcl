terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-applicationgatewaywebapplicationfirewallpolicy" {
  source  = "Azure/avm-res-network-applicationgatewaywebapplicationfirewallpolicy/azurerm"
  version = "0.2.0"

  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if managed_rules}}managed_rules       = {{hclVal managed_rules}}{{/if}}
  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if custom_rules}}custom_rules        = {{hclVal custom_rules}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                = {{hclVal lock}}{{/if}}
  {{#if policy_settings}}policy_settings     = {{hclVal policy_settings}}{{/if}}
  {{#if role_assignments}}role_assignments    = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts            = {{hclVal timeouts}}{{/if}}
}
