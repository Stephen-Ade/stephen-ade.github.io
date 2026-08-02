terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_ipgroup" {
  source  = "Azure/avm-res-network-ipgroup/azurerm"
  version = "0.2.0"

  {{#if ip_addresses}}ip_addresses        = {{hclVal ip_addresses}}{{/if}}
  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments    = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
}
