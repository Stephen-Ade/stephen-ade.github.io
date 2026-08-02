terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-servicebus-namespace" {
  source  = "Azure/avm-res-servicebus-namespace/azurerm"
  version = "0.4.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if authorization_rules}}authorization_rules                     = {{hclVal authorization_rules}}{{/if}}
  {{#if capacity}}capacity                                = {{hclVal capacity}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if infrastructure_encryption_enabled}}infrastructure_encryption_enabled       = {{hclVal infrastructure_encryption_enabled}}{{/if}}
  {{#if local_auth_enabled}}local_auth_enabled                      = {{hclVal local_auth_enabled}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if minimum_tls_version}}minimum_tls_version                     = {{hclVal minimum_tls_version}}{{/if}}
  {{#if network_rule_config}}network_rule_config                     = {{hclVal network_rule_config}}{{/if}}
  {{#if premium_messaging_partitions}}premium_messaging_partitions            = {{hclVal premium_messaging_partitions}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if queues}}queues                                  = {{hclVal queues}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                                     = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                = {{hclVal timeouts}}{{/if}}
  {{#if topics}}topics                                  = {{hclVal topics}}{{/if}}
}
