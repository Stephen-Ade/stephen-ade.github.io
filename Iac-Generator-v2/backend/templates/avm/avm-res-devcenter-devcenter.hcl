terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-devcenter-devcenter" {
  source  = "Azure/avm-res-devcenter-devcenter/azurerm"
  version = "0.1.1"

  {{#dev_center_name}}dev_center_name     = {{{dev_center_name}}}{{/dev_center_name}}
  {{#location}}location            = {{{location}}}{{/location}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#dev_center_identity}}dev_center_identity = {{{dev_center_identity}}}{{/dev_center_identity}}
  {{#dev_center_timeouts}}dev_center_timeouts = {{{dev_center_timeouts}}}{{/dev_center_timeouts}}
  {{#diagnostic_settings}}diagnostic_settings = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments    = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
}
