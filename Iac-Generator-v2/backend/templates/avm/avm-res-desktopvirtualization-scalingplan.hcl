terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_desktopvirtualization_scalingplan" {
  source  = "Azure/avm-res-desktopvirtualization-scalingplan/azurerm"
  version = "0.2.1"

  {{#if virtual_desktop_scaling_plan_location}}virtual_desktop_scaling_plan_location            = {{hclVal virtual_desktop_scaling_plan_location}}{{/if}}
  {{#if virtual_desktop_scaling_plan_name}}virtual_desktop_scaling_plan_name                = {{hclVal virtual_desktop_scaling_plan_name}}{{/if}}
  {{#if virtual_desktop_scaling_plan_resource_group_name}}virtual_desktop_scaling_plan_resource_group_name = {{hclVal virtual_desktop_scaling_plan_resource_group_name}}{{/if}}
  {{#if virtual_desktop_scaling_plan_schedule}}virtual_desktop_scaling_plan_schedule            = {{hclVal virtual_desktop_scaling_plan_schedule}}{{/if}}
  {{#if virtual_desktop_scaling_plan_time_zone}}virtual_desktop_scaling_plan_time_zone           = {{hclVal virtual_desktop_scaling_plan_time_zone}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                              = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                 = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                             = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments                                 = {{hclVal role_assignments}}{{/if}}
  {{#if virtual_desktop_scaling_plan_description}}virtual_desktop_scaling_plan_description         = {{hclVal virtual_desktop_scaling_plan_description}}{{/if}}
  {{#if virtual_desktop_scaling_plan_exclusion_tag}}virtual_desktop_scaling_plan_exclusion_tag       = {{hclVal virtual_desktop_scaling_plan_exclusion_tag}}{{/if}}
  {{#if virtual_desktop_scaling_plan_friendly_name}}virtual_desktop_scaling_plan_friendly_name       = {{hclVal virtual_desktop_scaling_plan_friendly_name}}{{/if}}
  {{#if virtual_desktop_scaling_plan_host_pool}}virtual_desktop_scaling_plan_host_pool           = {{hclVal virtual_desktop_scaling_plan_host_pool}}{{/if}}
  {{#if virtual_desktop_scaling_plan_tags}}virtual_desktop_scaling_plan_tags                = {{hclVal virtual_desktop_scaling_plan_tags}}{{/if}}
  {{#if virtual_desktop_scaling_plan_timeouts}}virtual_desktop_scaling_plan_timeouts            = {{hclVal virtual_desktop_scaling_plan_timeouts}}{{/if}}
}
