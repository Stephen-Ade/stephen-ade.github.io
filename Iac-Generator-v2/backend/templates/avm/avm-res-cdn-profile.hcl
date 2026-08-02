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

  {{#location}}location                     = {{{location}}}{{/location}}
  {{#name}}name                         = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name          = {{{resource_group_name}}}{{/resource_group_name}}
  {{#cdn_endpoint_custom_domains}}cdn_endpoint_custom_domains  = {{{cdn_endpoint_custom_domains}}}{{/cdn_endpoint_custom_domains}}
  {{#cdn_endpoints}}cdn_endpoints                = {{{cdn_endpoints}}}{{/cdn_endpoints}}
  {{#diagnostic_settings}}diagnostic_settings          = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry             = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#front_door_custom_domains}}front_door_custom_domains    = {{{front_door_custom_domains}}}{{/front_door_custom_domains}}
  {{#front_door_endpoints}}front_door_endpoints         = {{{front_door_endpoints}}}{{/front_door_endpoints}}
  {{#front_door_firewall_policies}}front_door_firewall_policies = {{{front_door_firewall_policies}}}{{/front_door_firewall_policies}}
  {{#front_door_origin_groups}}front_door_origin_groups     = {{{front_door_origin_groups}}}{{/front_door_origin_groups}}
  {{#front_door_origins}}front_door_origins           = {{{front_door_origins}}}{{/front_door_origins}}
  {{#front_door_routes}}front_door_routes            = {{{front_door_routes}}}{{/front_door_routes}}
  {{#front_door_rule_sets}}front_door_rule_sets         = {{{front_door_rule_sets}}}{{/front_door_rule_sets}}
  {{#front_door_rules}}front_door_rules             = {{{front_door_rules}}}{{/front_door_rules}}
  {{#front_door_secrets}}front_door_secrets           = {{{front_door_secrets}}}{{/front_door_secrets}}
  {{#front_door_security_policies}}front_door_security_policies = {{{front_door_security_policies}}}{{/front_door_security_policies}}
  {{#lock}}lock                         = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities           = {{{managed_identities}}}{{/managed_identities}}
  {{#metric_alerts}}metric_alerts                = {{{metric_alerts}}}{{/metric_alerts}}
  {{#response_timeout_seconds}}response_timeout_seconds     = {{{response_timeout_seconds}}}{{/response_timeout_seconds}}
  {{#role_assignments}}role_assignments             = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                          = {{{sku}}}{{/sku}}
  {{#tags}}tags                         = {{{tags}}}{{/tags}}
}
