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

  {{#if virtual_desktop_workspace_location}}virtual_desktop_workspace_location            = {{hclVal virtual_desktop_workspace_location}}{{/if}}
  {{#if virtual_desktop_workspace_name}}virtual_desktop_workspace_name                = {{hclVal virtual_desktop_workspace_name}}{{/if}}
  {{#if virtual_desktop_workspace_resource_group_name}}virtual_desktop_workspace_resource_group_name = {{hclVal virtual_desktop_workspace_resource_group_name}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                           = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                              = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                          = {{hclVal lock}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled                 = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if tracing_tags_enabled}}tracing_tags_enabled                          = {{hclVal tracing_tags_enabled}}{{/if}}
  {{#if tracing_tags_prefix}}tracing_tags_prefix                           = {{hclVal tracing_tags_prefix}}{{/if}}
  {{#if virtual_desktop_workspace_description}}virtual_desktop_workspace_description         = {{hclVal virtual_desktop_workspace_description}}{{/if}}
  {{#if virtual_desktop_workspace_friendly_name}}virtual_desktop_workspace_friendly_name       = {{hclVal virtual_desktop_workspace_friendly_name}}{{/if}}
  {{#if virtual_desktop_workspace_tags}}virtual_desktop_workspace_tags                = {{hclVal virtual_desktop_workspace_tags}}{{/if}}
  {{#if virtual_desktop_workspace_timeouts}}virtual_desktop_workspace_timeouts            = {{hclVal virtual_desktop_workspace_timeouts}}{{/if}}
}
