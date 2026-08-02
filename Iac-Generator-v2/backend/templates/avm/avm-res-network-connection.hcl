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

  {{#if location}}location                            = {{hclVal location}}{{/if}}
  {{#if name}}name                                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                 = {{hclVal resource_group_name}}{{/if}}
  {{#if type}}type                                = {{hclVal type}}{{/if}}
  {{#if virtual_network_gateway_resource_id}}virtual_network_gateway_resource_id = {{hclVal virtual_network_gateway_resource_id}}{{/if}}
  {{#if authorization_key}}authorization_key                   = {{hclVal authorization_key}}{{/if}}
  {{#if connection_mode}}connection_mode                     = {{hclVal connection_mode}}{{/if}}
  {{#if connection_protocol}}connection_protocol                 = {{hclVal connection_protocol}}{{/if}}
  {{#if custom_bgp_addresses}}custom_bgp_addresses                = {{hclVal custom_bgp_addresses}}{{/if}}
  {{#if dpd_timeout_seconds}}dpd_timeout_seconds                 = {{hclVal dpd_timeout_seconds}}{{/if}}
  {{#if egress_nat_rule_resource_ids}}egress_nat_rule_resource_ids        = {{hclVal egress_nat_rule_resource_ids}}{{/if}}
  {{#if enable_bgp}}enable_bgp                          = {{hclVal enable_bgp}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                    = {{hclVal enable_telemetry}}{{/if}}
  {{#if express_route_circuit_resource_id}}express_route_circuit_resource_id   = {{hclVal express_route_circuit_resource_id}}{{/if}}
  {{#if express_route_gateway_bypass}}express_route_gateway_bypass        = {{hclVal express_route_gateway_bypass}}{{/if}}
  {{#if ingress_nat_rule_resource_ids}}ingress_nat_rule_resource_ids       = {{hclVal ingress_nat_rule_resource_ids}}{{/if}}
  {{#if ipsec_policy}}ipsec_policy                        = {{hclVal ipsec_policy}}{{/if}}
  {{#if local_azure_ip_address_enabled}}local_azure_ip_address_enabled      = {{hclVal local_azure_ip_address_enabled}}{{/if}}
  {{#if local_network_gateway_resource_id}}local_network_gateway_resource_id   = {{hclVal local_network_gateway_resource_id}}{{/if}}
  {{#if lock}}lock                                = {{hclVal lock}}{{/if}}
  {{#if private_link_fast_path_enabled}}private_link_fast_path_enabled      = {{hclVal private_link_fast_path_enabled}}{{/if}}
  {{#if routing_weight}}routing_weight                      = {{hclVal routing_weight}}{{/if}}
  {{#if shared_key}}shared_key                          = {{hclVal shared_key}}{{/if}}
  {{#if tags}}tags                                = {{hclVal tags}}{{/if}}
  {{#if traffic_selector_policy}}traffic_selector_policy             = {{hclVal traffic_selector_policy}}{{/if}}
  {{#if use_policy_based_traffic_selectors}}use_policy_based_traffic_selectors  = {{hclVal use_policy_based_traffic_selectors}}{{/if}}
}
