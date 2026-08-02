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

  {{#location}}location              = {{{location}}}{{/location}}
  {{#name}}name                  = {{{name}}}{{/name}}
  {{#parent_id}}parent_id             = {{{parent_id}}}{{/parent_id}}
  {{#description}}description           = {{{description}}}{{/description}}
  {{#diagnostic_settings}}diagnostic_settings   = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry      = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#kind}}kind                  = {{{kind}}}{{/kind}}
  {{#lock}}lock                  = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities    = {{{managed_identities}}}{{/managed_identities}}
  {{#public_network_access}}public_network_access = {{{public_network_access}}}{{/public_network_access}}
  {{#role_assignments}}role_assignments      = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                   = {{{sku}}}{{/sku}}
  {{#tags}}tags                  = {{{tags}}}{{/tags}}
}
