terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_loadbalancer" {
  source  = "Azure/avm-res-network-loadbalancer/azurerm"
  version = "0.5.0"

  {{#if frontend_ip_configurations}}frontend_ip_configurations              = {{hclVal frontend_ip_configurations}}{{/if}}
  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if backend_address_pool_addresses}}backend_address_pool_addresses          = {{hclVal backend_address_pool_addresses}}{{/if}}
  {{#if backend_address_pool_configuration}}backend_address_pool_configuration      = {{hclVal backend_address_pool_configuration}}{{/if}}
  {{#if backend_address_pool_network_interfaces}}backend_address_pool_network_interfaces = {{hclVal backend_address_pool_network_interfaces}}{{/if}}
  {{#if backend_address_pools}}backend_address_pools                   = {{hclVal backend_address_pools}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if edge_zone}}edge_zone                               = {{hclVal edge_zone}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if frontend_subnet_resource_id}}frontend_subnet_resource_id             = {{hclVal frontend_subnet_resource_id}}{{/if}}
  {{#if lb_nat_pools}}lb_nat_pools                            = {{hclVal lb_nat_pools}}{{/if}}
  {{#if lb_nat_rules}}lb_nat_rules                            = {{hclVal lb_nat_rules}}{{/if}}
  {{#if lb_outbound_rules}}lb_outbound_rules                       = {{hclVal lb_outbound_rules}}{{/if}}
  {{#if lb_probes}}lb_probes                               = {{hclVal lb_probes}}{{/if}}
  {{#if lb_rules}}lb_rules                                = {{hclVal lb_rules}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if public_ip_address_configuration}}public_ip_address_configuration         = {{hclVal public_ip_address_configuration}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                                     = {{hclVal sku}}{{/if}}
  {{#if sku_tier}}sku_tier                                = {{hclVal sku_tier}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
}
