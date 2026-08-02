terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-networkmanager" {
  source  = "Azure/avm-res-network-networkmanager/azurerm"
  version = "0.3.0"

  {{#location}}location                       = {{{location}}}{{/location}}
  {{#name}}name                           = {{{name}}}{{/name}}
  {{#network_manager_scope}}network_manager_scope          = {{{network_manager_scope}}}{{/network_manager_scope}}
  {{#network_manager_scope_accesses}}network_manager_scope_accesses = {{{network_manager_scope_accesses}}}{{/network_manager_scope_accesses}}
  {{#resource_group_name}}resource_group_name            = {{{resource_group_name}}}{{/resource_group_name}}
  {{#connectivity_configurations}}connectivity_configurations    = {{{connectivity_configurations}}}{{/connectivity_configurations}}
  {{#description}}description                    = {{{description}}}{{/description}}
  {{#diagnostic_settings}}diagnostic_settings            = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry               = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                           = {{{lock}}}{{/lock}}
  {{#network_groups}}network_groups                 = {{{network_groups}}}{{/network_groups}}
  {{#network_manager_timeouts}}network_manager_timeouts       = {{{network_manager_timeouts}}}{{/network_manager_timeouts}}
  {{#role_assignments}}role_assignments               = {{{role_assignments}}}{{/role_assignments}}
  {{#routing_configurations}}routing_configurations         = {{{routing_configurations}}}{{/routing_configurations}}
  {{#scope_connections}}scope_connections              = {{{scope_connections}}}{{/scope_connections}}
  {{#security_admin_configurations}}security_admin_configurations  = {{{security_admin_configurations}}}{{/security_admin_configurations}}
  {{#tags}}tags                           = {{{tags}}}{{/tags}}
}
