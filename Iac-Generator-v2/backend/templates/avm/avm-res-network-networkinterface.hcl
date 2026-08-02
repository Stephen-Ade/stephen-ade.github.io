terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_networkinterface" {
  source  = "Azure/avm-res-network-networkinterface/azurerm"
  version = "0.1.1"

  {{#if ip_configurations}}ip_configurations                                    = {{hclVal ip_configurations}}{{/if}}
  {{#if location}}location                                             = {{hclVal location}}{{/if}}
  {{#if name}}name                                                 = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                                  = {{hclVal resource_group_name}}{{/if}}
  {{#if accelerated_networking_enabled}}accelerated_networking_enabled                       = {{hclVal accelerated_networking_enabled}}{{/if}}
  {{#if application_gateway_backend_address_pool_association}}application_gateway_backend_address_pool_association = {{hclVal application_gateway_backend_address_pool_association}}{{/if}}
  {{#if application_security_group_ids}}application_security_group_ids                       = {{hclVal application_security_group_ids}}{{/if}}
  {{#if dns_servers}}dns_servers                                          = {{hclVal dns_servers}}{{/if}}
  {{#if edge_zone}}edge_zone                                            = {{hclVal edge_zone}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                     = {{hclVal enable_telemetry}}{{/if}}
  {{#if internal_dns_name_label}}internal_dns_name_label                              = {{hclVal internal_dns_name_label}}{{/if}}
  {{#if ip_forwarding_enabled}}ip_forwarding_enabled                                = {{hclVal ip_forwarding_enabled}}{{/if}}
  {{#if load_balancer_backend_address_pool_association}}load_balancer_backend_address_pool_association       = {{hclVal load_balancer_backend_address_pool_association}}{{/if}}
  {{#if lock}}lock                                                 = {{hclVal lock}}{{/if}}
  {{#if nat_rule_association}}nat_rule_association                                 = {{hclVal nat_rule_association}}{{/if}}
  {{#if network_security_group_ids}}network_security_group_ids                           = {{hclVal network_security_group_ids}}{{/if}}
  {{#if tags}}tags                                                 = {{hclVal tags}}{{/if}}
}
