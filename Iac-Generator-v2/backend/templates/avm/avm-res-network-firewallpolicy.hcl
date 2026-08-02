terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-firewallpolicy" {
  source  = "Azure/avm-res-network-firewallpolicy/azurerm"
  version = "0.3.4"

  {{#if location}}location                                          = {{hclVal location}}{{/if}}
  {{#if name}}name                                              = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                               = {{hclVal resource_group_name}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                               = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                  = {{hclVal enable_telemetry}}{{/if}}
  {{#if firewall_policy_auto_learn_private_ranges_enabled}}firewall_policy_auto_learn_private_ranges_enabled = {{hclVal firewall_policy_auto_learn_private_ranges_enabled}}{{/if}}
  {{#if firewall_policy_base_policy_id}}firewall_policy_base_policy_id                    = {{hclVal firewall_policy_base_policy_id}}{{/if}}
  {{#if firewall_policy_dns}}firewall_policy_dns                               = {{hclVal firewall_policy_dns}}{{/if}}
  {{#if firewall_policy_explicit_proxy}}firewall_policy_explicit_proxy                    = {{hclVal firewall_policy_explicit_proxy}}{{/if}}
  {{#if firewall_policy_identity}}firewall_policy_identity                          = {{hclVal firewall_policy_identity}}{{/if}}
  {{#if firewall_policy_insights}}firewall_policy_insights                          = {{hclVal firewall_policy_insights}}{{/if}}
  {{#if firewall_policy_intrusion_detection}}firewall_policy_intrusion_detection               = {{hclVal firewall_policy_intrusion_detection}}{{/if}}
  {{#if firewall_policy_private_ip_ranges}}firewall_policy_private_ip_ranges                 = {{hclVal firewall_policy_private_ip_ranges}}{{/if}}
  {{#if firewall_policy_sku}}firewall_policy_sku                               = {{hclVal firewall_policy_sku}}{{/if}}
  {{#if firewall_policy_sql_redirect_allowed}}firewall_policy_sql_redirect_allowed              = {{hclVal firewall_policy_sql_redirect_allowed}}{{/if}}
  {{#if firewall_policy_threat_intelligence_allowlist}}firewall_policy_threat_intelligence_allowlist     = {{hclVal firewall_policy_threat_intelligence_allowlist}}{{/if}}
  {{#if firewall_policy_threat_intelligence_mode}}firewall_policy_threat_intelligence_mode          = {{hclVal firewall_policy_threat_intelligence_mode}}{{/if}}
  {{#if firewall_policy_timeouts}}firewall_policy_timeouts                          = {{hclVal firewall_policy_timeouts}}{{/if}}
  {{#if firewall_policy_tls_certificate}}firewall_policy_tls_certificate                   = {{hclVal firewall_policy_tls_certificate}}{{/if}}
  {{#if lock}}lock                                              = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments                                  = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                              = {{hclVal tags}}{{/if}}
}
