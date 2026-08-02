terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-localnetworkgateway" {
  source  = "Azure/avm-res-network-localnetworkgateway/azurerm"
  version = "0.2.0"

  {{#address_space}}address_space       = {{{address_space}}}{{/address_space}}
  {{#gateway_address}}gateway_address     = {{{gateway_address}}}{{/gateway_address}}
  {{#location}}location            = {{{location}}}{{/location}}
  {{#name}}name                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#bgp_settings}}bgp_settings        = {{{bgp_settings}}}{{/bgp_settings}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities  = {{{managed_identities}}}{{/managed_identities}}
  {{#role_assignments}}role_assignments    = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
}
