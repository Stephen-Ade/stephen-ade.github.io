terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_containerregistry_registry" {
  source  = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "0.7.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if admin_enabled}}admin_enabled                           = {{hclVal admin_enabled}}{{/if}}
  {{#if anonymous_pull_enabled}}anonymous_pull_enabled                  = {{hclVal anonymous_pull_enabled}}{{/if}}
  {{#if data_endpoint_enabled}}data_endpoint_enabled                   = {{hclVal data_endpoint_enabled}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if enable_trust_policy}}enable_trust_policy                     = {{hclVal enable_trust_policy}}{{/if}}
  {{#if export_policy_enabled}}export_policy_enabled                   = {{hclVal export_policy_enabled}}{{/if}}
  {{#if georeplications}}georeplications                         = {{hclVal georeplications}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if network_rule_bypass_for_tasks_enabled}}network_rule_bypass_for_tasks_enabled   = {{hclVal network_rule_bypass_for_tasks_enabled}}{{/if}}
  {{#if network_rule_bypass_option}}network_rule_bypass_option              = {{hclVal network_rule_bypass_option}}{{/if}}
  {{#if network_rule_set}}network_rule_set                        = {{hclVal network_rule_set}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if quarantine_policy_enabled}}quarantine_policy_enabled               = {{hclVal quarantine_policy_enabled}}{{/if}}
  {{#if retention_policy_in_days}}retention_policy_in_days                = {{hclVal retention_policy_in_days}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if scope_maps}}scope_maps                              = {{hclVal scope_maps}}{{/if}}
  {{#if sku}}sku                                     = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if zone_redundancy_enabled}}zone_redundancy_enabled                 = {{hclVal zone_redundancy_enabled}}{{/if}}
}
