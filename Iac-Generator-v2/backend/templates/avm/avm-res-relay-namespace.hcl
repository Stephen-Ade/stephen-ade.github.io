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

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_id}}resource_group_id                       = {{hclVal resource_group_id}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access}}public_network_access                   = {{hclVal public_network_access}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                                     = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
}
