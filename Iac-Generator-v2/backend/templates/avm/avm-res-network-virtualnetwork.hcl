terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-virtualnetwork" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.20.0"

  {{#if location}}location                = {{hclVal location}}{{/if}}
  {{#if parent_id}}parent_id               = {{hclVal parent_id}}{{/if}}
  {{#if address_space}}address_space           = {{hclVal address_space}}{{/if}}
  {{#if bgp_community}}bgp_community           = {{hclVal bgp_community}}{{/if}}
  {{#if ddos_protection_plan}}ddos_protection_plan    = {{hclVal ddos_protection_plan}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if dns_servers}}dns_servers             = {{hclVal dns_servers}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry        = {{hclVal enable_telemetry}}{{/if}}
  {{#if enable_vm_protection}}enable_vm_protection    = {{hclVal enable_vm_protection}}{{/if}}
  {{#if encryption}}encryption              = {{hclVal encryption}}{{/if}}
  {{#if extended_location}}extended_location       = {{hclVal extended_location}}{{/if}}
  {{#if flow_timeout_in_minutes}}flow_timeout_in_minutes = {{hclVal flow_timeout_in_minutes}}{{/if}}
  {{#if ipam_pools}}ipam_pools              = {{hclVal ipam_pools}}{{/if}}
  {{#if lock}}lock                    = {{hclVal lock}}{{/if}}
  {{#if name}}name                    = {{hclVal name}}{{/if}}
  {{#if peerings}}peerings                = {{hclVal peerings}}{{/if}}
  {{#if retry}}retry                   = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments        = {{hclVal role_assignments}}{{/if}}
  {{#if subnets}}subnets                 = {{hclVal subnets}}{{/if}}
  {{#if tags}}tags                    = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                = {{hclVal timeouts}}{{/if}}
}
