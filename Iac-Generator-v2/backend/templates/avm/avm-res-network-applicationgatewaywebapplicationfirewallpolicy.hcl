terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-applicationgatewaywebapplicationfirewallpolicy" {
  source  = "Azure/avm-res-network-applicationgatewaywebapplicationfirewallpolicy/azurerm"
  version = "0.2.0"

  {{#location}}location            = {{{location}}}{{/location}}
  {{#managed_rules}}managed_rules       = {{{managed_rules}}}{{/managed_rules}}
  {{#name}}name                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#custom_rules}}custom_rules        = {{{custom_rules}}}{{/custom_rules}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                = {{{lock}}}{{/lock}}
  {{#policy_settings}}policy_settings     = {{{policy_settings}}}{{/policy_settings}}
  {{#role_assignments}}role_assignments    = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts            = {{{timeouts}}}{{/timeouts}}
}
