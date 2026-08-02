terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-desktopvirtualization-applicationgroup" {
  source  = "Azure/avm-res-desktopvirtualization-applicationgroup/azurerm"
  version = "0.2.1"

  {{#virtual_desktop_application_group_host_pool_id}}virtual_desktop_application_group_host_pool_id                 = {{{virtual_desktop_application_group_host_pool_id}}}{{/virtual_desktop_application_group_host_pool_id}}
  {{#virtual_desktop_application_group_location}}virtual_desktop_application_group_location                     = {{{virtual_desktop_application_group_location}}}{{/virtual_desktop_application_group_location}}
  {{#virtual_desktop_application_group_name}}virtual_desktop_application_group_name                         = {{{virtual_desktop_application_group_name}}}{{/virtual_desktop_application_group_name}}
  {{#virtual_desktop_application_group_resource_group_name}}virtual_desktop_application_group_resource_group_name          = {{{virtual_desktop_application_group_resource_group_name}}}{{/virtual_desktop_application_group_resource_group_name}}
  {{#virtual_desktop_application_group_type}}virtual_desktop_application_group_type                         = {{{virtual_desktop_application_group_type}}}{{/virtual_desktop_application_group_type}}
  {{#diagnostic_settings}}diagnostic_settings                                            = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                                               = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                                           = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments                                               = {{{role_assignments}}}{{/role_assignments}}
  {{#tracing_tags_enabled}}tracing_tags_enabled                                           = {{{tracing_tags_enabled}}}{{/tracing_tags_enabled}}
  {{#tracing_tags_prefix}}tracing_tags_prefix                                            = {{{tracing_tags_prefix}}}{{/tracing_tags_prefix}}
  {{#virtual_desktop_application_group_default_desktop_display_name}}virtual_desktop_application_group_default_desktop_display_name = {{{virtual_desktop_application_group_default_desktop_display_name}}}{{/virtual_desktop_application_group_default_desktop_display_name}}
  {{#virtual_desktop_application_group_description}}virtual_desktop_application_group_description                  = {{{virtual_desktop_application_group_description}}}{{/virtual_desktop_application_group_description}}
  {{#virtual_desktop_application_group_friendly_name}}virtual_desktop_application_group_friendly_name                = {{{virtual_desktop_application_group_friendly_name}}}{{/virtual_desktop_application_group_friendly_name}}
  {{#virtual_desktop_application_group_tags}}virtual_desktop_application_group_tags                         = {{{virtual_desktop_application_group_tags}}}{{/virtual_desktop_application_group_tags}}
  {{#virtual_desktop_application_group_timeouts}}virtual_desktop_application_group_timeouts                     = {{{virtual_desktop_application_group_timeouts}}}{{/virtual_desktop_application_group_timeouts}}
}
