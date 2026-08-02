terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-privateendpoint" {
  source  = "Azure/avm-res-network-privateendpoint/azurerm"
  version = "0.2.0"

  {{#location}}location                                   = {{{location}}}{{/location}}
  {{#name}}name                                       = {{{name}}}{{/name}}
  {{#network_interface_name}}network_interface_name                     = {{{network_interface_name}}}{{/network_interface_name}}
  {{#private_connection_resource_id}}private_connection_resource_id             = {{{private_connection_resource_id}}}{{/private_connection_resource_id}}
  {{#resource_group_name}}resource_group_name                        = {{{resource_group_name}}}{{/resource_group_name}}
  {{#subnet_resource_id}}subnet_resource_id                         = {{{subnet_resource_id}}}{{/subnet_resource_id}}
  {{#application_security_group_association_ids}}application_security_group_association_ids = {{{application_security_group_association_ids}}}{{/application_security_group_association_ids}}
  {{#enable_telemetry}}enable_telemetry                           = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#ip_configurations}}ip_configurations                          = {{{ip_configurations}}}{{/ip_configurations}}
  {{#lock}}lock                                       = {{{lock}}}{{/lock}}
  {{#private_dns_zone_group_name}}private_dns_zone_group_name                = {{{private_dns_zone_group_name}}}{{/private_dns_zone_group_name}}
  {{#private_dns_zone_resource_ids}}private_dns_zone_resource_ids              = {{{private_dns_zone_resource_ids}}}{{/private_dns_zone_resource_ids}}
  {{#private_service_connection_name}}private_service_connection_name            = {{{private_service_connection_name}}}{{/private_service_connection_name}}
  {{#role_assignments}}role_assignments                           = {{{role_assignments}}}{{/role_assignments}}
  {{#subresource_names}}subresource_names                          = {{{subresource_names}}}{{/subresource_names}}
  {{#tags}}tags                                       = {{{tags}}}{{/tags}}
}
