terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-publicipaddress" {
  source  = "Azure/avm-res-network-publicipaddress/azurerm"
  version = "0.2.1"

  {{#if location}}location                = {{hclVal location}}{{/if}}
  {{#if name}}name                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name     = {{hclVal resource_group_name}}{{/if}}
  {{#if allocation_method}}allocation_method       = {{hclVal allocation_method}}{{/if}}
  {{#if ddos_protection_mode}}ddos_protection_mode    = {{hclVal ddos_protection_mode}}{{/if}}
  {{#if ddos_protection_plan_id}}ddos_protection_plan_id = {{hclVal ddos_protection_plan_id}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if domain_name_label}}domain_name_label       = {{hclVal domain_name_label}}{{/if}}
  {{#if edge_zone}}edge_zone               = {{hclVal edge_zone}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry        = {{hclVal enable_telemetry}}{{/if}}
  {{#if idle_timeout_in_minutes}}idle_timeout_in_minutes = {{hclVal idle_timeout_in_minutes}}{{/if}}
  {{#if ip_tags}}ip_tags                 = {{hclVal ip_tags}}{{/if}}
  {{#if ip_version}}ip_version              = {{hclVal ip_version}}{{/if}}
  {{#if lock}}lock                    = {{hclVal lock}}{{/if}}
  {{#if public_ip_prefix_id}}public_ip_prefix_id     = {{hclVal public_ip_prefix_id}}{{/if}}
  {{#if reverse_fqdn}}reverse_fqdn            = {{hclVal reverse_fqdn}}{{/if}}
  {{#if role_assignments}}role_assignments        = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                     = {{hclVal sku}}{{/if}}
  {{#if sku_tier}}sku_tier                = {{hclVal sku_tier}}{{/if}}
  {{#if tags}}tags                    = {{hclVal tags}}{{/if}}
  {{#if zones}}zones                   = {{hclVal zones}}{{/if}}
}
