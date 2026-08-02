terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-routetable" {
  source  = "Azure/avm-res-network-routetable/azurerm"
  version = "0.5.0"

  {{#if location}}location                      = {{hclVal location}}{{/if}}
  {{#if name}}name                          = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name           = {{hclVal resource_group_name}}{{/if}}
  {{#if bgp_route_propagation_enabled}}bgp_route_propagation_enabled = {{hclVal bgp_route_propagation_enabled}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry              = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                          = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments              = {{hclVal role_assignments}}{{/if}}
  {{#if routes}}routes                        = {{hclVal routes}}{{/if}}
  {{#if routes_legacy_mode}}routes_legacy_mode            = {{hclVal routes_legacy_mode}}{{/if}}
  {{#if subnet_resource_ids}}subnet_resource_ids           = {{hclVal subnet_resource_ids}}{{/if}}
  {{#if tags}}tags                          = {{hclVal tags}}{{/if}}
}
