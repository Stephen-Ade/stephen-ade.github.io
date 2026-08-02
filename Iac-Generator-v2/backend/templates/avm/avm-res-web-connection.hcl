terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-web-connection" {
  source  = "Azure/avm-res-web-connection/azurerm"
  version = "0.1.0"

  {{#managed_api_id}}managed_api_id      = {{{managed_api_id}}}{{/managed_api_id}}
  {{#name}}name                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#display_name}}display_name        = {{{display_name}}}{{/display_name}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                = {{{lock}}}{{/lock}}
  {{#parameter_values}}parameter_values    = {{{parameter_values}}}{{/parameter_values}}
  {{#role_assignments}}role_assignments    = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
}
