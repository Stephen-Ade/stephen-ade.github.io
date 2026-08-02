terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-connection" {
  source  = "Azure/avm-res-network-connection/azurerm"
  version = "0.2.0"

  {{#location}}location                            = {{{location}}}{{/location}}
  {{#name}}name                                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                 = {{{resource_group_name}}}{{/resource_group_name}}
  {{#type}}type                                = {{{type}}}{{/type}}
  {{#virtual_network_gateway_resource_id}}virtual_network_gateway_resource_id = {{{virtual_network_gateway_resource_id}}}{{/virtual_network_gateway_resource_id}}
  {{#authorization_key}}authorization_key                   = {{{authorization_key}}}{{/authorization_key}}
  {{#connection_mode}}connection_mode                     = {{{connection_mode}}}{{/connection_mode}}
  {{#connection_protocol}}connection_protocol                 = {{{connection_protocol}}}{{/connection_protocol}}
  {{#custom_bgp_addresses}}custom_bgp_addresses                = {{{custom_bgp_addresses}}}{{/custom_bgp_addresses}}
  {{#dpd_timeout_seconds}}dpd_timeout_seconds                 = {{{dpd_timeout_seconds}}}{{/dpd_timeout_seconds}}
  {{#egress_nat_rule_resource_ids}}egress_nat_rule_resource_ids        = {{{egress_nat_rule_resource_ids}}}{{/egress_nat_rule_resource_ids}}
  {{#enable_bgp}}enable_bgp                          = {{{enable_bgp}}}{{/enable_bgp}}
  {{#enable_telemetry}}enable_telemetry                    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#express_route_circuit_resource_id}}express_route_circuit_resource_id   = {{{express_route_circuit_resource_id}}}{{/express_route_circuit_resource_id}}
  {{#express_route_gateway_bypass}}express_route_gateway_bypass        = {{{express_route_gateway_bypass}}}{{/express_route_gateway_bypass}}
  {{#ingress_nat_rule_resource_ids}}ingress_nat_rule_resource_ids       = {{{ingress_nat_rule_resource_ids}}}{{/ingress_nat_rule_resource_ids}}
  {{#ipsec_policy}}ipsec_policy                        = {{{ipsec_policy}}}{{/ipsec_policy}}
  {{#local_azure_ip_address_enabled}}local_azure_ip_address_enabled      = {{{local_azure_ip_address_enabled}}}{{/local_azure_ip_address_enabled}}
  {{#local_network_gateway_resource_id}}local_network_gateway_resource_id   = {{{local_network_gateway_resource_id}}}{{/local_network_gateway_resource_id}}
  {{#lock}}lock                                = {{{lock}}}{{/lock}}
  {{#private_link_fast_path_enabled}}private_link_fast_path_enabled      = {{{private_link_fast_path_enabled}}}{{/private_link_fast_path_enabled}}
  {{#routing_weight}}routing_weight                      = {{{routing_weight}}}{{/routing_weight}}
  {{#shared_key}}shared_key                          = {{{shared_key}}}{{/shared_key}}
  {{#tags}}tags                                = {{{tags}}}{{/tags}}
  {{#traffic_selector_policy}}traffic_selector_policy             = {{{traffic_selector_policy}}}{{/traffic_selector_policy}}
  {{#use_policy_based_traffic_selectors}}use_policy_based_traffic_selectors  = {{{use_policy_based_traffic_selectors}}}{{/use_policy_based_traffic_selectors}}
}
