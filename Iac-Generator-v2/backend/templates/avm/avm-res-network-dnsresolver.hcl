terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-dnsresolver" {
  source  = "Azure/avm-res-network-dnsresolver/azurerm"
  version = "0.8.0"

  {{#location}}location                    = {{{location}}}{{/location}}
  {{#name}}name                        = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name         = {{{resource_group_name}}}{{/resource_group_name}}
  {{#virtual_network_resource_id}}virtual_network_resource_id = {{{virtual_network_resource_id}}}{{/virtual_network_resource_id}}
  {{#enable_telemetry}}enable_telemetry            = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#inbound_endpoints}}inbound_endpoints           = {{{inbound_endpoints}}}{{/inbound_endpoints}}
  {{#lock}}lock                        = {{{lock}}}{{/lock}}
  {{#outbound_endpoints}}outbound_endpoints          = {{{outbound_endpoints}}}{{/outbound_endpoints}}
  {{#role_assignments}}role_assignments            = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                        = {{{tags}}}{{/tags}}
}
