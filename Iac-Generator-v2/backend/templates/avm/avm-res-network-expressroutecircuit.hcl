terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_expressroutecircuit" {
  source  = "Azure/avm-res-network-expressroutecircuit/azurerm"
  version = "0.3.3"

  {{#if location}}location                             = {{hclVal location}}{{/if}}
  {{#if name}}name                                 = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                  = {{hclVal resource_group_name}}{{/if}}
  {{#if sku}}sku                                  = {{hclVal sku}}{{/if}}
  {{#if allow_classic_operations}}allow_classic_operations             = {{hclVal allow_classic_operations}}{{/if}}
  {{#if authorization_key}}authorization_key                    = {{hclVal authorization_key}}{{/if}}
  {{#if bandwidth_in_gbps}}bandwidth_in_gbps                    = {{hclVal bandwidth_in_gbps}}{{/if}}
  {{#if bandwidth_in_mbps}}bandwidth_in_mbps                    = {{hclVal bandwidth_in_mbps}}{{/if}}
  {{#if circuit_connections}}circuit_connections                  = {{hclVal circuit_connections}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                  = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                     = {{hclVal enable_telemetry}}{{/if}}
  {{#if er_gw_connections}}er_gw_connections                    = {{hclVal er_gw_connections}}{{/if}}
  {{#if express_route_circuit_authorizations}}express_route_circuit_authorizations = {{hclVal express_route_circuit_authorizations}}{{/if}}
  {{#if express_route_port_resource_id}}express_route_port_resource_id       = {{hclVal express_route_port_resource_id}}{{/if}}
  {{#if exr_circuit_tags}}exr_circuit_tags                     = {{hclVal exr_circuit_tags}}{{/if}}
  {{#if lock}}lock                                 = {{hclVal lock}}{{/if}}
  {{#if peering_location}}peering_location                     = {{hclVal peering_location}}{{/if}}
  {{#if peerings}}peerings                             = {{hclVal peerings}}{{/if}}
  {{#if role_assignments}}role_assignments                     = {{hclVal role_assignments}}{{/if}}
  {{#if service_provider_name}}service_provider_name                = {{hclVal service_provider_name}}{{/if}}
  {{#if tags}}tags                                 = {{hclVal tags}}{{/if}}
  {{#if vnet_gw_connections}}vnet_gw_connections                  = {{hclVal vnet_gw_connections}}{{/if}}
}
