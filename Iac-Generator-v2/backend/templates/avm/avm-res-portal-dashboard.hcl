terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-portal-dashboard" {
  source  = "Azure/avm-res-portal-dashboard/azurerm"
  version = "0.1.0"

  {{#location}}location                = {{{location}}}{{/location}}
  {{#name}}name                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#template_file_path}}template_file_path      = {{{template_file_path}}}{{/template_file_path}}
  {{#enable_telemetry}}enable_telemetry        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#tags}}tags                    = {{{tags}}}{{/tags}}
  {{#template_file_variables}}template_file_variables = {{{template_file_variables}}}{{/template_file_variables}}
}
