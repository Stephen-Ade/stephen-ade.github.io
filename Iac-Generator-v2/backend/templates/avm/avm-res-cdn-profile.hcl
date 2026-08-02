terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-cdn-profile" {
  source  = "Azure/avm-res-cdn-profile/azurerm"
  version = "0.1.9"

  {{#if location}}location                     = {{hclVal location}}{{/if}}
  {{#if name}}name                         = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name          = {{hclVal resource_group_name}}{{/if}}
  {{#if cdn_endpoint_custom_domains}}cdn_endpoint_custom_domains  = {{hclVal cdn_endpoint_custom_domains}}{{/if}}
  {{#if cdn_endpoints}}cdn_endpoints                = {{hclVal cdn_endpoints}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings          = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry             = {{hclVal enable_telemetry}}{{/if}}
  {{#if front_door_custom_domains}}front_door_custom_domains    = {{hclVal front_door_custom_domains}}{{/if}}
  {{#if front_door_endpoints}}front_door_endpoints         = {{hclVal front_door_endpoints}}{{/if}}
  {{#if front_door_firewall_policies}}front_door_firewall_policies = {{hclVal front_door_firewall_policies}}{{/if}}
  {{#if front_door_origin_groups}}front_door_origin_groups     = {{hclVal front_door_origin_groups}}{{/if}}
  {{#if front_door_origins}}front_door_origins           = {{hclVal front_door_origins}}{{/if}}
  {{#if front_door_routes}}front_door_routes            = {{hclVal front_door_routes}}{{/if}}
  {{#if front_door_rule_sets}}front_door_rule_sets         = {{hclVal front_door_rule_sets}}{{/if}}
  {{#if front_door_rules}}front_door_rules             = {{hclVal front_door_rules}}{{/if}}
  {{#if front_door_secrets}}front_door_secrets           = {{hclVal front_door_secrets}}{{/if}}
  {{#if front_door_security_policies}}front_door_security_policies = {{hclVal front_door_security_policies}}{{/if}}
  {{#if lock}}lock                         = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities           = {{hclVal managed_identities}}{{/if}}
  {{#if metric_alerts}}metric_alerts                = {{hclVal metric_alerts}}{{/if}}
  {{#if response_timeout_seconds}}response_timeout_seconds     = {{hclVal response_timeout_seconds}}{{/if}}
  {{#if role_assignments}}role_assignments             = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                          = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                         = {{hclVal tags}}{{/if}}
}
