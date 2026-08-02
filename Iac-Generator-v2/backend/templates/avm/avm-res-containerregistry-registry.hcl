terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-containerregistry-registry" {
  source  = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "0.7.0"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#admin_enabled}}admin_enabled                           = {{{admin_enabled}}}{{/admin_enabled}}
  {{#anonymous_pull_enabled}}anonymous_pull_enabled                  = {{{anonymous_pull_enabled}}}{{/anonymous_pull_enabled}}
  {{#data_endpoint_enabled}}data_endpoint_enabled                   = {{{data_endpoint_enabled}}}{{/data_endpoint_enabled}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#enable_trust_policy}}enable_trust_policy                     = {{{enable_trust_policy}}}{{/enable_trust_policy}}
  {{#export_policy_enabled}}export_policy_enabled                   = {{{export_policy_enabled}}}{{/export_policy_enabled}}
  {{#georeplications}}georeplications                         = {{{georeplications}}}{{/georeplications}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#network_rule_bypass_for_tasks_enabled}}network_rule_bypass_for_tasks_enabled   = {{{network_rule_bypass_for_tasks_enabled}}}{{/network_rule_bypass_for_tasks_enabled}}
  {{#network_rule_bypass_option}}network_rule_bypass_option              = {{{network_rule_bypass_option}}}{{/network_rule_bypass_option}}
  {{#network_rule_set}}network_rule_set                        = {{{network_rule_set}}}{{/network_rule_set}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#quarantine_policy_enabled}}quarantine_policy_enabled               = {{{quarantine_policy_enabled}}}{{/quarantine_policy_enabled}}
  {{#retention_policy_in_days}}retention_policy_in_days                = {{{retention_policy_in_days}}}{{/retention_policy_in_days}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#scope_maps}}scope_maps                              = {{{scope_maps}}}{{/scope_maps}}
  {{#sku}}sku                                     = {{{sku}}}{{/sku}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#zone_redundancy_enabled}}zone_redundancy_enabled                 = {{{zone_redundancy_enabled}}}{{/zone_redundancy_enabled}}
}
