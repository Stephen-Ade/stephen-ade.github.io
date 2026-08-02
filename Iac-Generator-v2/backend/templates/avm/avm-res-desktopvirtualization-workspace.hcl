terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-desktopvirtualization-workspace" {
  source  = "Azure/avm-res-desktopvirtualization-workspace/azurerm"
  version = "0.2.2"

  {{#virtual_desktop_workspace_location}}virtual_desktop_workspace_location            = {{{virtual_desktop_workspace_location}}}{{/virtual_desktop_workspace_location}}
  {{#virtual_desktop_workspace_name}}virtual_desktop_workspace_name                = {{{virtual_desktop_workspace_name}}}{{/virtual_desktop_workspace_name}}
  {{#virtual_desktop_workspace_resource_group_name}}virtual_desktop_workspace_resource_group_name = {{{virtual_desktop_workspace_resource_group_name}}}{{/virtual_desktop_workspace_resource_group_name}}
  {{#diagnostic_settings}}diagnostic_settings                           = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                              = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                          = {{{lock}}}{{/lock}}
  {{#public_network_access_enabled}}public_network_access_enabled                 = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#tracing_tags_enabled}}tracing_tags_enabled                          = {{{tracing_tags_enabled}}}{{/tracing_tags_enabled}}
  {{#tracing_tags_prefix}}tracing_tags_prefix                           = {{{tracing_tags_prefix}}}{{/tracing_tags_prefix}}
  {{#virtual_desktop_workspace_description}}virtual_desktop_workspace_description         = {{{virtual_desktop_workspace_description}}}{{/virtual_desktop_workspace_description}}
  {{#virtual_desktop_workspace_friendly_name}}virtual_desktop_workspace_friendly_name       = {{{virtual_desktop_workspace_friendly_name}}}{{/virtual_desktop_workspace_friendly_name}}
  {{#virtual_desktop_workspace_tags}}virtual_desktop_workspace_tags                = {{{virtual_desktop_workspace_tags}}}{{/virtual_desktop_workspace_tags}}
  {{#virtual_desktop_workspace_timeouts}}virtual_desktop_workspace_timeouts            = {{{virtual_desktop_workspace_timeouts}}}{{/virtual_desktop_workspace_timeouts}}
}
