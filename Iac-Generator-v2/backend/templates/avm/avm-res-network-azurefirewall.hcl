terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-azurefirewall" {
  source  = "Azure/avm-res-network-azurefirewall/azurerm"
  version = "0.4.0"

  {{#if firewall_sku_name}}firewall_sku_name                    = {{hclVal firewall_sku_name}}{{/if}}
  {{#if firewall_sku_tier}}firewall_sku_tier                    = {{hclVal firewall_sku_tier}}{{/if}}
  {{#if location}}location                             = {{hclVal location}}{{/if}}
  {{#if name}}name                                 = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                  = {{hclVal resource_group_name}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                  = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                     = {{hclVal enable_telemetry}}{{/if}}
  {{#if firewall_ip_configuration}}firewall_ip_configuration            = {{hclVal firewall_ip_configuration}}{{/if}}
  {{#if firewall_management_ip_configuration}}firewall_management_ip_configuration = {{hclVal firewall_management_ip_configuration}}{{/if}}
  {{#if firewall_policy_id}}firewall_policy_id                   = {{hclVal firewall_policy_id}}{{/if}}
  {{#if firewall_private_ip_ranges}}firewall_private_ip_ranges           = {{hclVal firewall_private_ip_ranges}}{{/if}}
  {{#if firewall_timeouts}}firewall_timeouts                    = {{hclVal firewall_timeouts}}{{/if}}
  {{#if firewall_virtual_hub}}firewall_virtual_hub                 = {{hclVal firewall_virtual_hub}}{{/if}}
  {{#if firewall_zones}}firewall_zones                       = {{hclVal firewall_zones}}{{/if}}
  {{#if ip_configurations}}ip_configurations                    = {{hclVal ip_configurations}}{{/if}}
  {{#if lock}}lock                                 = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments                     = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                 = {{hclVal tags}}{{/if}}
}
