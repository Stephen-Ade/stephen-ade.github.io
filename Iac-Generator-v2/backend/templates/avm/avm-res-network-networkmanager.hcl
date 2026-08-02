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

  {{#if location}}location                       = {{hclVal location}}{{/if}}
  {{#if name}}name                           = {{hclVal name}}{{/if}}
  {{#if network_manager_scope}}network_manager_scope          = {{hclVal network_manager_scope}}{{/if}}
  {{#if network_manager_scope_accesses}}network_manager_scope_accesses = {{hclVal network_manager_scope_accesses}}{{/if}}
  {{#if resource_group_name}}resource_group_name            = {{hclVal resource_group_name}}{{/if}}
  {{#if connectivity_configurations}}connectivity_configurations    = {{hclVal connectivity_configurations}}{{/if}}
  {{#if description}}description                    = {{hclVal description}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings            = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry               = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                           = {{hclVal lock}}{{/if}}
  {{#if network_groups}}network_groups                 = {{hclVal network_groups}}{{/if}}
  {{#if network_manager_timeouts}}network_manager_timeouts       = {{hclVal network_manager_timeouts}}{{/if}}
  {{#if role_assignments}}role_assignments               = {{hclVal role_assignments}}{{/if}}
  {{#if routing_configurations}}routing_configurations         = {{hclVal routing_configurations}}{{/if}}
  {{#if scope_connections}}scope_connections              = {{hclVal scope_connections}}{{/if}}
  {{#if security_admin_configurations}}security_admin_configurations  = {{hclVal security_admin_configurations}}{{/if}}
  {{#if tags}}tags                           = {{hclVal tags}}{{/if}}
}
