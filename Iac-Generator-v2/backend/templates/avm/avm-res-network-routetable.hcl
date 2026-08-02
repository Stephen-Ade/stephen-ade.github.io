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

  {{#location}}location                      = {{{location}}}{{/location}}
  {{#name}}name                          = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name           = {{{resource_group_name}}}{{/resource_group_name}}
  {{#bgp_route_propagation_enabled}}bgp_route_propagation_enabled = {{{bgp_route_propagation_enabled}}}{{/bgp_route_propagation_enabled}}
  {{#enable_telemetry}}enable_telemetry              = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                          = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments              = {{{role_assignments}}}{{/role_assignments}}
  {{#routes}}routes                        = {{{routes}}}{{/routes}}
  {{#routes_legacy_mode}}routes_legacy_mode            = {{{routes_legacy_mode}}}{{/routes_legacy_mode}}
  {{#subnet_resource_ids}}subnet_resource_ids           = {{{subnet_resource_ids}}}{{/subnet_resource_ids}}
  {{#tags}}tags                          = {{{tags}}}{{/tags}}
}
