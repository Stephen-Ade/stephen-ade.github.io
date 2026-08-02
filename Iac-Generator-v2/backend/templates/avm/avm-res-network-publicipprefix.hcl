terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_publicipprefix" {
  source  = "Azure/avm-res-network-publicipprefix/azurerm"
  version = "0.1.0"

  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if prefix_length}}prefix_length       = {{hclVal prefix_length}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if ip_version}}ip_version          = {{hclVal ip_version}}{{/if}}
  {{#if lock}}lock                = {{hclVal lock}}{{/if}}
  {{#if sku_name}}sku_name            = {{hclVal sku_name}}{{/if}}
  {{#if sku_tier}}sku_tier            = {{hclVal sku_tier}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
  {{#if zones}}zones               = {{hclVal zones}}{{/if}}
}
