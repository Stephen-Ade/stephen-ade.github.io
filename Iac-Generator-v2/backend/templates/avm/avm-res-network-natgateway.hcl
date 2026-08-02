terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_natgateway" {
  source  = "Azure/avm-res-network-natgateway/azurerm"
  version = "0.3.2"

  {{#if location}}location                         = {{hclVal location}}{{/if}}
  {{#if name}}name                             = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                        = {{hclVal parent_id}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings              = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                 = {{hclVal enable_telemetry}}{{/if}}
  {{#if idle_timeout_in_minutes}}idle_timeout_in_minutes          = {{hclVal idle_timeout_in_minutes}}{{/if}}
  {{#if lock}}lock                             = {{hclVal lock}}{{/if}}
  {{#if public_ip_configuration}}public_ip_configuration          = {{hclVal public_ip_configuration}}{{/if}}
  {{#if public_ip_prefix_resource_ids}}public_ip_prefix_resource_ids    = {{hclVal public_ip_prefix_resource_ids}}{{/if}}
  {{#if public_ip_prefix_v6_resource_ids}}public_ip_prefix_v6_resource_ids = {{hclVal public_ip_prefix_v6_resource_ids}}{{/if}}
  {{#if public_ip_resource_ids}}public_ip_resource_ids           = {{hclVal public_ip_resource_ids}}{{/if}}
  {{#if public_ip_v6_resource_ids}}public_ip_v6_resource_ids        = {{hclVal public_ip_v6_resource_ids}}{{/if}}
  {{#if public_ips}}public_ips                       = {{hclVal public_ips}}{{/if}}
  {{#if role_assignments}}role_assignments                 = {{hclVal role_assignments}}{{/if}}
  {{#if sku_name}}sku_name                         = {{hclVal sku_name}}{{/if}}
  {{#if tags}}tags                             = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                         = {{hclVal timeouts}}{{/if}}
  {{#if zones}}zones                            = {{hclVal zones}}{{/if}}
}
