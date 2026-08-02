terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_localnetworkgateway" {
  source  = "Azure/avm-res-network-localnetworkgateway/azurerm"
  version = "0.2.0"

  {{#if address_space}}address_space       = {{hclVal address_space}}{{/if}}
  {{#if gateway_address}}gateway_address     = {{hclVal gateway_address}}{{/if}}
  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if bgp_settings}}bgp_settings        = {{hclVal bgp_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities  = {{hclVal managed_identities}}{{/if}}
  {{#if role_assignments}}role_assignments    = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
}
