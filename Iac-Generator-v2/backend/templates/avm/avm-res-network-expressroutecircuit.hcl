terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-expressroutecircuit" {
  source  = "Azure/avm-res-network-expressroutecircuit/azurerm"
  version = "0.3.3"

  {{#location}}location                             = {{{location}}}{{/location}}
  {{#name}}name                                 = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                  = {{{resource_group_name}}}{{/resource_group_name}}
  {{#sku}}sku                                  = {{{sku}}}{{/sku}}
  {{#allow_classic_operations}}allow_classic_operations             = {{{allow_classic_operations}}}{{/allow_classic_operations}}
  {{#authorization_key}}authorization_key                    = {{{authorization_key}}}{{/authorization_key}}
  {{#bandwidth_in_gbps}}bandwidth_in_gbps                    = {{{bandwidth_in_gbps}}}{{/bandwidth_in_gbps}}
  {{#bandwidth_in_mbps}}bandwidth_in_mbps                    = {{{bandwidth_in_mbps}}}{{/bandwidth_in_mbps}}
  {{#circuit_connections}}circuit_connections                  = {{{circuit_connections}}}{{/circuit_connections}}
  {{#diagnostic_settings}}diagnostic_settings                  = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#er_gw_connections}}er_gw_connections                    = {{{er_gw_connections}}}{{/er_gw_connections}}
  {{#express_route_circuit_authorizations}}express_route_circuit_authorizations = {{{express_route_circuit_authorizations}}}{{/express_route_circuit_authorizations}}
  {{#express_route_port_resource_id}}express_route_port_resource_id       = {{{express_route_port_resource_id}}}{{/express_route_port_resource_id}}
  {{#exr_circuit_tags}}exr_circuit_tags                     = {{{exr_circuit_tags}}}{{/exr_circuit_tags}}
  {{#lock}}lock                                 = {{{lock}}}{{/lock}}
  {{#peering_location}}peering_location                     = {{{peering_location}}}{{/peering_location}}
  {{#peerings}}peerings                             = {{{peerings}}}{{/peerings}}
  {{#role_assignments}}role_assignments                     = {{{role_assignments}}}{{/role_assignments}}
  {{#service_provider_name}}service_provider_name                = {{{service_provider_name}}}{{/service_provider_name}}
  {{#tags}}tags                                 = {{{tags}}}{{/tags}}
  {{#vnet_gw_connections}}vnet_gw_connections                  = {{{vnet_gw_connections}}}{{/vnet_gw_connections}}
}
