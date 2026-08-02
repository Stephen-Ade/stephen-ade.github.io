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

  {{#if virtual_desktop_application_group_host_pool_id}}virtual_desktop_application_group_host_pool_id                 = {{hclVal virtual_desktop_application_group_host_pool_id}}{{/if}}
  {{#if virtual_desktop_application_group_location}}virtual_desktop_application_group_location                     = {{hclVal virtual_desktop_application_group_location}}{{/if}}
  {{#if virtual_desktop_application_group_name}}virtual_desktop_application_group_name                         = {{hclVal virtual_desktop_application_group_name}}{{/if}}
  {{#if virtual_desktop_application_group_resource_group_name}}virtual_desktop_application_group_resource_group_name          = {{hclVal virtual_desktop_application_group_resource_group_name}}{{/if}}
  {{#if virtual_desktop_application_group_type}}virtual_desktop_application_group_type                         = {{hclVal virtual_desktop_application_group_type}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                                            = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                               = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                                           = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments                                               = {{hclVal role_assignments}}{{/if}}
  {{#if tracing_tags_enabled}}tracing_tags_enabled                                           = {{hclVal tracing_tags_enabled}}{{/if}}
  {{#if tracing_tags_prefix}}tracing_tags_prefix                                            = {{hclVal tracing_tags_prefix}}{{/if}}
  {{#if virtual_desktop_application_group_default_desktop_display_name}}virtual_desktop_application_group_default_desktop_display_name = {{hclVal virtual_desktop_application_group_default_desktop_display_name}}{{/if}}
  {{#if virtual_desktop_application_group_description}}virtual_desktop_application_group_description                  = {{hclVal virtual_desktop_application_group_description}}{{/if}}
  {{#if virtual_desktop_application_group_friendly_name}}virtual_desktop_application_group_friendly_name                = {{hclVal virtual_desktop_application_group_friendly_name}}{{/if}}
  {{#if virtual_desktop_application_group_tags}}virtual_desktop_application_group_tags                         = {{hclVal virtual_desktop_application_group_tags}}{{/if}}
  {{#if virtual_desktop_application_group_timeouts}}virtual_desktop_application_group_timeouts                     = {{hclVal virtual_desktop_application_group_timeouts}}{{/if}}
}
