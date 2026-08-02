terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_insights_datacollectionrule" {
  source  = "Azure/avm-res-insights-datacollectionrule/azurerm"
  version = "0.1.0"

  {{#if location}}location                    = {{hclVal location}}{{/if}}
  {{#if name}}name                        = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                   = {{hclVal parent_id}}{{/if}}
  {{#if agent_settings}}agent_settings              = {{hclVal agent_settings}}{{/if}}
  {{#if data_collection_endpoint_id}}data_collection_endpoint_id = {{hclVal data_collection_endpoint_id}}{{/if}}
  {{#if data_flows}}data_flows                  = {{hclVal data_flows}}{{/if}}
  {{#if data_sources}}data_sources                = {{hclVal data_sources}}{{/if}}
  {{#if description}}description                 = {{hclVal description}}{{/if}}
  {{#if destinations}}destinations                = {{hclVal destinations}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings         = {{hclVal diagnostic_settings}}{{/if}}
  {{#if direct_data_sources}}direct_data_sources         = {{hclVal direct_data_sources}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry            = {{hclVal enable_telemetry}}{{/if}}
  {{#if kind}}kind                        = {{hclVal kind}}{{/if}}
  {{#if lock}}lock                        = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities          = {{hclVal managed_identities}}{{/if}}
  {{#if references}}references                  = {{hclVal references}}{{/if}}
  {{#if role_assignments}}role_assignments            = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                         = {{hclVal sku}}{{/if}}
  {{#if stream_declarations}}stream_declarations         = {{hclVal stream_declarations}}{{/if}}
  {{#if tags}}tags                        = {{hclVal tags}}{{/if}}
}
