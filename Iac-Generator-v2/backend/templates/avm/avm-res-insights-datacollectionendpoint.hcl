terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-insights-datacollectionendpoint" {
  source  = "Azure/avm-res-insights-datacollectionendpoint/azurerm"
  version = "0.2.0"

  {{#if location}}location              = {{hclVal location}}{{/if}}
  {{#if name}}name                  = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id             = {{hclVal parent_id}}{{/if}}
  {{#if description}}description           = {{hclVal description}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings   = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry      = {{hclVal enable_telemetry}}{{/if}}
  {{#if kind}}kind                  = {{hclVal kind}}{{/if}}
  {{#if lock}}lock                  = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities    = {{hclVal managed_identities}}{{/if}}
  {{#if public_network_access}}public_network_access = {{hclVal public_network_access}}{{/if}}
  {{#if role_assignments}}role_assignments      = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                   = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                  = {{hclVal tags}}{{/if}}
}
