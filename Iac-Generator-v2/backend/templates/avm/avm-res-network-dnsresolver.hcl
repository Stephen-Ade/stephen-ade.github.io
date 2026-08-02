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

  {{#if location}}location                    = {{hclVal location}}{{/if}}
  {{#if name}}name                        = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name         = {{hclVal resource_group_name}}{{/if}}
  {{#if virtual_network_resource_id}}virtual_network_resource_id = {{hclVal virtual_network_resource_id}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry            = {{hclVal enable_telemetry}}{{/if}}
  {{#if inbound_endpoints}}inbound_endpoints           = {{hclVal inbound_endpoints}}{{/if}}
  {{#if lock}}lock                        = {{hclVal lock}}{{/if}}
  {{#if outbound_endpoints}}outbound_endpoints          = {{hclVal outbound_endpoints}}{{/if}}
  {{#if role_assignments}}role_assignments            = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                        = {{hclVal tags}}{{/if}}
}
