terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-eventhub-namespace" {
  source  = "Azure/avm-res-eventhub-namespace/azurerm"
  version = "0.1.0"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#auto_inflate_enabled}}auto_inflate_enabled                    = {{{auto_inflate_enabled}}}{{/auto_inflate_enabled}}
  {{#capacity}}capacity                                = {{{capacity}}}{{/capacity}}
  {{#dedicated_cluster_id}}dedicated_cluster_id                    = {{{dedicated_cluster_id}}}{{/dedicated_cluster_id}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#event_hubs}}event_hubs                              = {{{event_hubs}}}{{/event_hubs}}
  {{#existing_parent_resource}}existing_parent_resource                = {{{existing_parent_resource}}}{{/existing_parent_resource}}
  {{#local_authentication_enabled}}local_authentication_enabled            = {{{local_authentication_enabled}}}{{/local_authentication_enabled}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#maximum_throughput_units}}maximum_throughput_units                = {{{maximum_throughput_units}}}{{/maximum_throughput_units}}
  {{#network_rulesets}}network_rulesets                        = {{{network_rulesets}}}{{/network_rulesets}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                                     = {{{sku}}}{{/sku}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
}
