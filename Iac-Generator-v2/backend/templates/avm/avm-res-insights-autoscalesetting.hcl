terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-insights-autoscalesetting" {
  source  = "Azure/avm-res-insights-autoscalesetting/azurerm"
  version = "0.1.2"

  {{#location}}location            = {{{location}}}{{/location}}
  {{#name}}name                = {{{name}}}{{/name}}
  {{#profiles}}profiles            = {{{profiles}}}{{/profiles}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#target_resource_id}}target_resource_id  = {{{target_resource_id}}}{{/target_resource_id}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#enabled}}enabled             = {{{enabled}}}{{/enabled}}
  {{#notification}}notification        = {{{notification}}}{{/notification}}
  {{#predictive}}predictive          = {{{predictive}}}{{/predictive}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
}
