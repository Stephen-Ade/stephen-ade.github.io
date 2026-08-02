terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_azurestackhci_logicalnetwork" {
  source  = "Azure/avm-res-azurestackhci-logicalnetwork/azurerm"
  version = "2.0.0"

  {{#if custom_location_id}}custom_location_id          = {{hclVal custom_location_id}}{{/if}}
  {{#if location}}location                    = {{hclVal location}}{{/if}}
  {{#if name}}name                        = {{hclVal name}}{{/if}}
  {{#if resource_group_id}}resource_group_id           = {{hclVal resource_group_id}}{{/if}}
  {{#if vm_switch_name}}vm_switch_name              = {{hclVal vm_switch_name}}{{/if}}
  {{#if address_prefix}}address_prefix              = {{hclVal address_prefix}}{{/if}}
  {{#if default_gateway}}default_gateway             = {{hclVal default_gateway}}{{/if}}
  {{#if dns_servers}}dns_servers                 = {{hclVal dns_servers}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry            = {{hclVal enable_telemetry}}{{/if}}
  {{#if ending_address}}ending_address              = {{hclVal ending_address}}{{/if}}
  {{#if ip_allocation_method}}ip_allocation_method        = {{hclVal ip_allocation_method}}{{/if}}
  {{#if ip_configuration_references}}ip_configuration_references = {{hclVal ip_configuration_references}}{{/if}}
  {{#if lock}}lock                        = {{hclVal lock}}{{/if}}
  {{#if logical_network_tags}}logical_network_tags        = {{hclVal logical_network_tags}}{{/if}}
  {{#if role_assignments}}role_assignments            = {{hclVal role_assignments}}{{/if}}
  {{#if route_name}}route_name                  = {{hclVal route_name}}{{/if}}
  {{#if starting_address}}starting_address            = {{hclVal starting_address}}{{/if}}
  {{#if subnet_0_name}}subnet_0_name               = {{hclVal subnet_0_name}}{{/if}}
  {{#if vlan_id}}vlan_id                     = {{hclVal vlan_id}}{{/if}}
}
