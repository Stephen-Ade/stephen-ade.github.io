terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-resourcegraph-query" {
  source  = "Azure/avm-res-resourcegraph-query/azurerm"
  version = "0.1.0"

  {{#location}}location            = {{{location}}}{{/location}}
  {{#name}}name                = {{{name}}}{{/name}}
  {{#query_string}}query_string        = {{{query_string}}}{{/query_string}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#description}}description         = {{{description}}}{{/description}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments    = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
}
