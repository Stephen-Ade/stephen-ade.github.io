terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-desktopvirtualization-scalingplan" {
  source  = "Azure/avm-res-desktopvirtualization-scalingplan/azurerm"
  version = "0.2.1"

  {{#virtual_desktop_scaling_plan_location}}virtual_desktop_scaling_plan_location            = {{{virtual_desktop_scaling_plan_location}}}{{/virtual_desktop_scaling_plan_location}}
  {{#virtual_desktop_scaling_plan_name}}virtual_desktop_scaling_plan_name                = {{{virtual_desktop_scaling_plan_name}}}{{/virtual_desktop_scaling_plan_name}}
  {{#virtual_desktop_scaling_plan_resource_group_name}}virtual_desktop_scaling_plan_resource_group_name = {{{virtual_desktop_scaling_plan_resource_group_name}}}{{/virtual_desktop_scaling_plan_resource_group_name}}
  {{#virtual_desktop_scaling_plan_schedule}}virtual_desktop_scaling_plan_schedule            = {{{virtual_desktop_scaling_plan_schedule}}}{{/virtual_desktop_scaling_plan_schedule}}
  {{#virtual_desktop_scaling_plan_time_zone}}virtual_desktop_scaling_plan_time_zone           = {{{virtual_desktop_scaling_plan_time_zone}}}{{/virtual_desktop_scaling_plan_time_zone}}
  {{#diagnostic_settings}}diagnostic_settings                              = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                                 = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                             = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments                                 = {{{role_assignments}}}{{/role_assignments}}
  {{#virtual_desktop_scaling_plan_description}}virtual_desktop_scaling_plan_description         = {{{virtual_desktop_scaling_plan_description}}}{{/virtual_desktop_scaling_plan_description}}
  {{#virtual_desktop_scaling_plan_exclusion_tag}}virtual_desktop_scaling_plan_exclusion_tag       = {{{virtual_desktop_scaling_plan_exclusion_tag}}}{{/virtual_desktop_scaling_plan_exclusion_tag}}
  {{#virtual_desktop_scaling_plan_friendly_name}}virtual_desktop_scaling_plan_friendly_name       = {{{virtual_desktop_scaling_plan_friendly_name}}}{{/virtual_desktop_scaling_plan_friendly_name}}
  {{#virtual_desktop_scaling_plan_host_pool}}virtual_desktop_scaling_plan_host_pool           = {{{virtual_desktop_scaling_plan_host_pool}}}{{/virtual_desktop_scaling_plan_host_pool}}
  {{#virtual_desktop_scaling_plan_tags}}virtual_desktop_scaling_plan_tags                = {{{virtual_desktop_scaling_plan_tags}}}{{/virtual_desktop_scaling_plan_tags}}
  {{#virtual_desktop_scaling_plan_timeouts}}virtual_desktop_scaling_plan_timeouts            = {{{virtual_desktop_scaling_plan_timeouts}}}{{/virtual_desktop_scaling_plan_timeouts}}
}
