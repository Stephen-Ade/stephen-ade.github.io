terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-certificateregistration-certificateorder" {
  source  = "Azure/avm-res-certificateregistration-certificateorder/azurerm"
  version = "0.1.0"

  {{#if location}}location                           = {{hclVal location}}{{/if}}
  {{#if name}}name                               = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                = {{hclVal resource_group_name}}{{/if}}
  {{#if auto_renew}}auto_renew                         = {{hclVal auto_renew}}{{/if}}
  {{#if certificate_order_key_vault_stores}}certificate_order_key_vault_stores = {{hclVal certificate_order_key_vault_stores}}{{/if}}
  {{#if csr}}csr                                = {{hclVal csr}}{{/if}}
  {{#if distinguished_name}}distinguished_name                 = {{hclVal distinguished_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                   = {{hclVal enable_telemetry}}{{/if}}
  {{#if key_size}}key_size                           = {{hclVal key_size}}{{/if}}
  {{#if lock}}lock                               = {{hclVal lock}}{{/if}}
  {{#if product_type}}product_type                       = {{hclVal product_type}}{{/if}}
  {{#if role_assignments}}role_assignments                   = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                               = {{hclVal tags}}{{/if}}
  {{#if validity_in_years}}validity_in_years                  = {{hclVal validity_in_years}}{{/if}}
}
