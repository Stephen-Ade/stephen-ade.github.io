terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-azurestackhci-logicalnetwork" {
  source  = "Azure/avm-res-azurestackhci-logicalnetwork/azurerm"
  version = "2.0.0"

  {{#custom_location_id}}custom_location_id          = {{{custom_location_id}}}{{/custom_location_id}}
  {{#location}}location                    = {{{location}}}{{/location}}
  {{#name}}name                        = {{{name}}}{{/name}}
  {{#resource_group_id}}resource_group_id           = {{{resource_group_id}}}{{/resource_group_id}}
  {{#vm_switch_name}}vm_switch_name              = {{{vm_switch_name}}}{{/vm_switch_name}}
  {{#address_prefix}}address_prefix              = {{{address_prefix}}}{{/address_prefix}}
  {{#default_gateway}}default_gateway             = {{{default_gateway}}}{{/default_gateway}}
  {{#dns_servers}}dns_servers                 = {{{dns_servers}}}{{/dns_servers}}
  {{#enable_telemetry}}enable_telemetry            = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#ending_address}}ending_address              = {{{ending_address}}}{{/ending_address}}
  {{#ip_allocation_method}}ip_allocation_method        = {{{ip_allocation_method}}}{{/ip_allocation_method}}
  {{#ip_configuration_references}}ip_configuration_references = {{{ip_configuration_references}}}{{/ip_configuration_references}}
  {{#lock}}lock                        = {{{lock}}}{{/lock}}
  {{#logical_network_tags}}logical_network_tags        = {{{logical_network_tags}}}{{/logical_network_tags}}
  {{#role_assignments}}role_assignments            = {{{role_assignments}}}{{/role_assignments}}
  {{#route_name}}route_name                  = {{{route_name}}}{{/route_name}}
  {{#starting_address}}starting_address            = {{{starting_address}}}{{/starting_address}}
  {{#subnet_0_name}}subnet_0_name               = {{{subnet_0_name}}}{{/subnet_0_name}}
  {{#vlan_id}}vlan_id                     = {{{vlan_id}}}{{/vlan_id}}
}
