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

  {{#location}}location                                          = {{{location}}}{{/location}}
  {{#name}}name                                              = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                               = {{{resource_group_name}}}{{/resource_group_name}}
  {{#diagnostic_settings}}diagnostic_settings                               = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                                  = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#firewall_policy_auto_learn_private_ranges_enabled}}firewall_policy_auto_learn_private_ranges_enabled = {{{firewall_policy_auto_learn_private_ranges_enabled}}}{{/firewall_policy_auto_learn_private_ranges_enabled}}
  {{#firewall_policy_base_policy_id}}firewall_policy_base_policy_id                    = {{{firewall_policy_base_policy_id}}}{{/firewall_policy_base_policy_id}}
  {{#firewall_policy_dns}}firewall_policy_dns                               = {{{firewall_policy_dns}}}{{/firewall_policy_dns}}
  {{#firewall_policy_explicit_proxy}}firewall_policy_explicit_proxy                    = {{{firewall_policy_explicit_proxy}}}{{/firewall_policy_explicit_proxy}}
  {{#firewall_policy_identity}}firewall_policy_identity                          = {{{firewall_policy_identity}}}{{/firewall_policy_identity}}
  {{#firewall_policy_insights}}firewall_policy_insights                          = {{{firewall_policy_insights}}}{{/firewall_policy_insights}}
  {{#firewall_policy_intrusion_detection}}firewall_policy_intrusion_detection               = {{{firewall_policy_intrusion_detection}}}{{/firewall_policy_intrusion_detection}}
  {{#firewall_policy_private_ip_ranges}}firewall_policy_private_ip_ranges                 = {{{firewall_policy_private_ip_ranges}}}{{/firewall_policy_private_ip_ranges}}
  {{#firewall_policy_sku}}firewall_policy_sku                               = {{{firewall_policy_sku}}}{{/firewall_policy_sku}}
  {{#firewall_policy_sql_redirect_allowed}}firewall_policy_sql_redirect_allowed              = {{{firewall_policy_sql_redirect_allowed}}}{{/firewall_policy_sql_redirect_allowed}}
  {{#firewall_policy_threat_intelligence_allowlist}}firewall_policy_threat_intelligence_allowlist     = {{{firewall_policy_threat_intelligence_allowlist}}}{{/firewall_policy_threat_intelligence_allowlist}}
  {{#firewall_policy_threat_intelligence_mode}}firewall_policy_threat_intelligence_mode          = {{{firewall_policy_threat_intelligence_mode}}}{{/firewall_policy_threat_intelligence_mode}}
  {{#firewall_policy_timeouts}}firewall_policy_timeouts                          = {{{firewall_policy_timeouts}}}{{/firewall_policy_timeouts}}
  {{#firewall_policy_tls_certificate}}firewall_policy_tls_certificate                   = {{{firewall_policy_tls_certificate}}}{{/firewall_policy_tls_certificate}}
  {{#lock}}lock                                              = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments                                  = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                              = {{{tags}}}{{/tags}}
}
