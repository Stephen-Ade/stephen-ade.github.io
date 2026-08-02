terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-desktopvirtualization-hostpool" {
  source  = "Azure/avm-res-desktopvirtualization-hostpool/azurerm"
  version = "0.4.0"

  {{#if resource_group_name}}resource_group_name                                        = {{hclVal resource_group_name}}{{/if}}
  {{#if virtual_desktop_host_pool_load_balancer_type}}virtual_desktop_host_pool_load_balancer_type               = {{hclVal virtual_desktop_host_pool_load_balancer_type}}{{/if}}
  {{#if virtual_desktop_host_pool_location}}virtual_desktop_host_pool_location                         = {{hclVal virtual_desktop_host_pool_location}}{{/if}}
  {{#if virtual_desktop_host_pool_name}}virtual_desktop_host_pool_name                             = {{hclVal virtual_desktop_host_pool_name}}{{/if}}
  {{#if virtual_desktop_host_pool_resource_group_name}}virtual_desktop_host_pool_resource_group_name              = {{hclVal virtual_desktop_host_pool_resource_group_name}}{{/if}}
  {{#if virtual_desktop_host_pool_type}}virtual_desktop_host_pool_type                             = {{hclVal virtual_desktop_host_pool_type}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                                        = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                           = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                                       = {{hclVal lock}}{{/if}}
  {{#if private_endpoints}}private_endpoints                                          = {{hclVal private_endpoints}}{{/if}}
  {{#if registration_expiration_period}}registration_expiration_period                             = {{hclVal registration_expiration_period}}{{/if}}
  {{#if role_assignments}}role_assignments                                           = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                                       = {{hclVal tags}}{{/if}}
  {{#if tracing_tags_enabled}}tracing_tags_enabled                                       = {{hclVal tracing_tags_enabled}}{{/if}}
  {{#if tracing_tags_prefix}}tracing_tags_prefix                                        = {{hclVal tracing_tags_prefix}}{{/if}}
  {{#if virtual_desktop_host_pool_custom_rdp_properties}}virtual_desktop_host_pool_custom_rdp_properties            = {{hclVal virtual_desktop_host_pool_custom_rdp_properties}}{{/if}}
  {{#if virtual_desktop_host_pool_description}}virtual_desktop_host_pool_description                      = {{hclVal virtual_desktop_host_pool_description}}{{/if}}
  {{#if virtual_desktop_host_pool_friendly_name}}virtual_desktop_host_pool_friendly_name                    = {{hclVal virtual_desktop_host_pool_friendly_name}}{{/if}}
  {{#if virtual_desktop_host_pool_maximum_sessions_allowed}}virtual_desktop_host_pool_maximum_sessions_allowed         = {{hclVal virtual_desktop_host_pool_maximum_sessions_allowed}}{{/if}}
  {{#if virtual_desktop_host_pool_personal_desktop_assignment_type}}virtual_desktop_host_pool_personal_desktop_assignment_type = {{hclVal virtual_desktop_host_pool_personal_desktop_assignment_type}}{{/if}}
  {{#if virtual_desktop_host_pool_preferred_app_group_type}}virtual_desktop_host_pool_preferred_app_group_type         = {{hclVal virtual_desktop_host_pool_preferred_app_group_type}}{{/if}}
  {{#if virtual_desktop_host_pool_scheduled_agent_updates}}virtual_desktop_host_pool_scheduled_agent_updates          = {{hclVal virtual_desktop_host_pool_scheduled_agent_updates}}{{/if}}
  {{#if virtual_desktop_host_pool_start_vm_on_connect}}virtual_desktop_host_pool_start_vm_on_connect              = {{hclVal virtual_desktop_host_pool_start_vm_on_connect}}{{/if}}
  {{#if virtual_desktop_host_pool_tags}}virtual_desktop_host_pool_tags                             = {{hclVal virtual_desktop_host_pool_tags}}{{/if}}
  {{#if virtual_desktop_host_pool_timeouts}}virtual_desktop_host_pool_timeouts                         = {{hclVal virtual_desktop_host_pool_timeouts}}{{/if}}
  {{#if virtual_desktop_host_pool_validate_environment}}virtual_desktop_host_pool_validate_environment             = {{hclVal virtual_desktop_host_pool_validate_environment}}{{/if}}
  {{#if virtual_desktop_host_pool_vm_template}}virtual_desktop_host_pool_vm_template                      = {{hclVal virtual_desktop_host_pool_vm_template}}{{/if}}
}
