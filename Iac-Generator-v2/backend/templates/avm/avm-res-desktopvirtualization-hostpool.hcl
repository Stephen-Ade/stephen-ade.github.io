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

  {{#resource_group_name}}resource_group_name                                        = {{{resource_group_name}}}{{/resource_group_name}}
  {{#virtual_desktop_host_pool_load_balancer_type}}virtual_desktop_host_pool_load_balancer_type               = {{{virtual_desktop_host_pool_load_balancer_type}}}{{/virtual_desktop_host_pool_load_balancer_type}}
  {{#virtual_desktop_host_pool_location}}virtual_desktop_host_pool_location                         = {{{virtual_desktop_host_pool_location}}}{{/virtual_desktop_host_pool_location}}
  {{#virtual_desktop_host_pool_name}}virtual_desktop_host_pool_name                             = {{{virtual_desktop_host_pool_name}}}{{/virtual_desktop_host_pool_name}}
  {{#virtual_desktop_host_pool_resource_group_name}}virtual_desktop_host_pool_resource_group_name              = {{{virtual_desktop_host_pool_resource_group_name}}}{{/virtual_desktop_host_pool_resource_group_name}}
  {{#virtual_desktop_host_pool_type}}virtual_desktop_host_pool_type                             = {{{virtual_desktop_host_pool_type}}}{{/virtual_desktop_host_pool_type}}
  {{#diagnostic_settings}}diagnostic_settings                                        = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                                           = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                                       = {{{lock}}}{{/lock}}
  {{#private_endpoints}}private_endpoints                                          = {{{private_endpoints}}}{{/private_endpoints}}
  {{#registration_expiration_period}}registration_expiration_period                             = {{{registration_expiration_period}}}{{/registration_expiration_period}}
  {{#role_assignments}}role_assignments                                           = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                                       = {{{tags}}}{{/tags}}
  {{#tracing_tags_enabled}}tracing_tags_enabled                                       = {{{tracing_tags_enabled}}}{{/tracing_tags_enabled}}
  {{#tracing_tags_prefix}}tracing_tags_prefix                                        = {{{tracing_tags_prefix}}}{{/tracing_tags_prefix}}
  {{#virtual_desktop_host_pool_custom_rdp_properties}}virtual_desktop_host_pool_custom_rdp_properties            = {{{virtual_desktop_host_pool_custom_rdp_properties}}}{{/virtual_desktop_host_pool_custom_rdp_properties}}
  {{#virtual_desktop_host_pool_description}}virtual_desktop_host_pool_description                      = {{{virtual_desktop_host_pool_description}}}{{/virtual_desktop_host_pool_description}}
  {{#virtual_desktop_host_pool_friendly_name}}virtual_desktop_host_pool_friendly_name                    = {{{virtual_desktop_host_pool_friendly_name}}}{{/virtual_desktop_host_pool_friendly_name}}
  {{#virtual_desktop_host_pool_maximum_sessions_allowed}}virtual_desktop_host_pool_maximum_sessions_allowed         = {{{virtual_desktop_host_pool_maximum_sessions_allowed}}}{{/virtual_desktop_host_pool_maximum_sessions_allowed}}
  {{#virtual_desktop_host_pool_personal_desktop_assignment_type}}virtual_desktop_host_pool_personal_desktop_assignment_type = {{{virtual_desktop_host_pool_personal_desktop_assignment_type}}}{{/virtual_desktop_host_pool_personal_desktop_assignment_type}}
  {{#virtual_desktop_host_pool_preferred_app_group_type}}virtual_desktop_host_pool_preferred_app_group_type         = {{{virtual_desktop_host_pool_preferred_app_group_type}}}{{/virtual_desktop_host_pool_preferred_app_group_type}}
  {{#virtual_desktop_host_pool_scheduled_agent_updates}}virtual_desktop_host_pool_scheduled_agent_updates          = {{{virtual_desktop_host_pool_scheduled_agent_updates}}}{{/virtual_desktop_host_pool_scheduled_agent_updates}}
  {{#virtual_desktop_host_pool_start_vm_on_connect}}virtual_desktop_host_pool_start_vm_on_connect              = {{{virtual_desktop_host_pool_start_vm_on_connect}}}{{/virtual_desktop_host_pool_start_vm_on_connect}}
  {{#virtual_desktop_host_pool_tags}}virtual_desktop_host_pool_tags                             = {{{virtual_desktop_host_pool_tags}}}{{/virtual_desktop_host_pool_tags}}
  {{#virtual_desktop_host_pool_timeouts}}virtual_desktop_host_pool_timeouts                         = {{{virtual_desktop_host_pool_timeouts}}}{{/virtual_desktop_host_pool_timeouts}}
  {{#virtual_desktop_host_pool_validate_environment}}virtual_desktop_host_pool_validate_environment             = {{{virtual_desktop_host_pool_validate_environment}}}{{/virtual_desktop_host_pool_validate_environment}}
  {{#virtual_desktop_host_pool_vm_template}}virtual_desktop_host_pool_vm_template                      = {{{virtual_desktop_host_pool_vm_template}}}{{/virtual_desktop_host_pool_vm_template}}
}
