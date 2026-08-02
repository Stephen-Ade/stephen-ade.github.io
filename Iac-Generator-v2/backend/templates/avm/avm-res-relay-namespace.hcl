terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-relay-namespace" {
  source  = "Azure/avm-res-relay-namespace/azurerm"
  version = "0.1.1"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_id}}resource_group_id                       = {{{resource_group_id}}}{{/resource_group_id}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access}}public_network_access                   = {{{public_network_access}}}{{/public_network_access}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                                     = {{{sku}}}{{/sku}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
}
