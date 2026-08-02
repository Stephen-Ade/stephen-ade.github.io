terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_eventhub_namespace" {
  source  = "Azure/avm-res-eventhub-namespace/azurerm"
  version = "0.1.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if auto_inflate_enabled}}auto_inflate_enabled                    = {{hclVal auto_inflate_enabled}}{{/if}}
  {{#if capacity}}capacity                                = {{hclVal capacity}}{{/if}}
  {{#if dedicated_cluster_id}}dedicated_cluster_id                    = {{hclVal dedicated_cluster_id}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if event_hubs}}event_hubs                              = {{hclVal event_hubs}}{{/if}}
  {{#if existing_parent_resource}}existing_parent_resource                = {{hclVal existing_parent_resource}}{{/if}}
  {{#if local_authentication_enabled}}local_authentication_enabled            = {{hclVal local_authentication_enabled}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if maximum_throughput_units}}maximum_throughput_units                = {{hclVal maximum_throughput_units}}{{/if}}
  {{#if network_rulesets}}network_rulesets                        = {{hclVal network_rulesets}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                                     = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
}
