terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-loadbalancer" {
  source  = "Azure/avm-res-network-loadbalancer/azurerm"
  version = "0.5.0"

  {{#frontend_ip_configurations}}frontend_ip_configurations              = {{{frontend_ip_configurations}}}{{/frontend_ip_configurations}}
  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#backend_address_pool_addresses}}backend_address_pool_addresses          = {{{backend_address_pool_addresses}}}{{/backend_address_pool_addresses}}
  {{#backend_address_pool_configuration}}backend_address_pool_configuration      = {{{backend_address_pool_configuration}}}{{/backend_address_pool_configuration}}
  {{#backend_address_pool_network_interfaces}}backend_address_pool_network_interfaces = {{{backend_address_pool_network_interfaces}}}{{/backend_address_pool_network_interfaces}}
  {{#backend_address_pools}}backend_address_pools                   = {{{backend_address_pools}}}{{/backend_address_pools}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#edge_zone}}edge_zone                               = {{{edge_zone}}}{{/edge_zone}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#frontend_subnet_resource_id}}frontend_subnet_resource_id             = {{{frontend_subnet_resource_id}}}{{/frontend_subnet_resource_id}}
  {{#lb_nat_pools}}lb_nat_pools                            = {{{lb_nat_pools}}}{{/lb_nat_pools}}
  {{#lb_nat_rules}}lb_nat_rules                            = {{{lb_nat_rules}}}{{/lb_nat_rules}}
  {{#lb_outbound_rules}}lb_outbound_rules                       = {{{lb_outbound_rules}}}{{/lb_outbound_rules}}
  {{#lb_probes}}lb_probes                               = {{{lb_probes}}}{{/lb_probes}}
  {{#lb_rules}}lb_rules                                = {{{lb_rules}}}{{/lb_rules}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#public_ip_address_configuration}}public_ip_address_configuration         = {{{public_ip_address_configuration}}}{{/public_ip_address_configuration}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                                     = {{{sku}}}{{/sku}}
  {{#sku_tier}}sku_tier                                = {{{sku_tier}}}{{/sku_tier}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
}
