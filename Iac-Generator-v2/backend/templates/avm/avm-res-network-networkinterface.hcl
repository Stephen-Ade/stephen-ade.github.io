terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-networkinterface" {
  source  = "Azure/avm-res-network-networkinterface/azurerm"
  version = "0.1.1"

  {{#ip_configurations}}ip_configurations                                    = {{{ip_configurations}}}{{/ip_configurations}}
  {{#location}}location                                             = {{{location}}}{{/location}}
  {{#name}}name                                                 = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                                  = {{{resource_group_name}}}{{/resource_group_name}}
  {{#accelerated_networking_enabled}}accelerated_networking_enabled                       = {{{accelerated_networking_enabled}}}{{/accelerated_networking_enabled}}
  {{#application_gateway_backend_address_pool_association}}application_gateway_backend_address_pool_association = {{{application_gateway_backend_address_pool_association}}}{{/application_gateway_backend_address_pool_association}}
  {{#application_security_group_ids}}application_security_group_ids                       = {{{application_security_group_ids}}}{{/application_security_group_ids}}
  {{#dns_servers}}dns_servers                                          = {{{dns_servers}}}{{/dns_servers}}
  {{#edge_zone}}edge_zone                                            = {{{edge_zone}}}{{/edge_zone}}
  {{#enable_telemetry}}enable_telemetry                                     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#internal_dns_name_label}}internal_dns_name_label                              = {{{internal_dns_name_label}}}{{/internal_dns_name_label}}
  {{#ip_forwarding_enabled}}ip_forwarding_enabled                                = {{{ip_forwarding_enabled}}}{{/ip_forwarding_enabled}}
  {{#load_balancer_backend_address_pool_association}}load_balancer_backend_address_pool_association       = {{{load_balancer_backend_address_pool_association}}}{{/load_balancer_backend_address_pool_association}}
  {{#lock}}lock                                                 = {{{lock}}}{{/lock}}
  {{#nat_rule_association}}nat_rule_association                                 = {{{nat_rule_association}}}{{/nat_rule_association}}
  {{#network_security_group_ids}}network_security_group_ids                           = {{{network_security_group_ids}}}{{/network_security_group_ids}}
  {{#tags}}tags                                                 = {{{tags}}}{{/tags}}
}
