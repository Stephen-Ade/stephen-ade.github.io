terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-maintenance-maintenanceconfiguration" {
  source  = "Azure/avm-res-maintenance-maintenanceconfiguration/azurerm"
  version = "0.1.0"

  {{#location}}location             = {{{location}}}{{/location}}
  {{#name}}name                 = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name  = {{{resource_group_name}}}{{/resource_group_name}}
  {{#scope}}scope                = {{{scope}}}{{/scope}}
  {{#enable_telemetry}}enable_telemetry     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#extension_properties}}extension_properties = {{{extension_properties}}}{{/extension_properties}}
  {{#install_patches}}install_patches      = {{{install_patches}}}{{/install_patches}}
  {{#lock}}lock                 = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments     = {{{role_assignments}}}{{/role_assignments}}
  {{#subscription_id}}subscription_id      = {{{subscription_id}}}{{/subscription_id}}
  {{#tags}}tags                 = {{{tags}}}{{/tags}}
  {{#visibility}}visibility           = {{{visibility}}}{{/visibility}}
  {{#window}}window               = {{{window}}}{{/window}}
}
