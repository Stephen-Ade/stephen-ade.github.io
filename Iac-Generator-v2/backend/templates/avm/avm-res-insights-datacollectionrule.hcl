terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-insights-datacollectionrule" {
  source  = "Azure/avm-res-insights-datacollectionrule/azurerm"
  version = "0.1.0"

  {{#location}}location                    = {{{location}}}{{/location}}
  {{#name}}name                        = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                   = {{{parent_id}}}{{/parent_id}}
  {{#agent_settings}}agent_settings              = {{{agent_settings}}}{{/agent_settings}}
  {{#data_collection_endpoint_id}}data_collection_endpoint_id = {{{data_collection_endpoint_id}}}{{/data_collection_endpoint_id}}
  {{#data_flows}}data_flows                  = {{{data_flows}}}{{/data_flows}}
  {{#data_sources}}data_sources                = {{{data_sources}}}{{/data_sources}}
  {{#description}}description                 = {{{description}}}{{/description}}
  {{#destinations}}destinations                = {{{destinations}}}{{/destinations}}
  {{#diagnostic_settings}}diagnostic_settings         = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#direct_data_sources}}direct_data_sources         = {{{direct_data_sources}}}{{/direct_data_sources}}
  {{#enable_telemetry}}enable_telemetry            = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#kind}}kind                        = {{{kind}}}{{/kind}}
  {{#lock}}lock                        = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities          = {{{managed_identities}}}{{/managed_identities}}
  {{#references}}references                  = {{{references}}}{{/references}}
  {{#role_assignments}}role_assignments            = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                         = {{{sku}}}{{/sku}}
  {{#stream_declarations}}stream_declarations         = {{{stream_declarations}}}{{/stream_declarations}}
  {{#tags}}tags                        = {{{tags}}}{{/tags}}
}
