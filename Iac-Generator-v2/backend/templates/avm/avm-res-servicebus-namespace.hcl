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

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#authorization_rules}}authorization_rules                     = {{{authorization_rules}}}{{/authorization_rules}}
  {{#capacity}}capacity                                = {{{capacity}}}{{/capacity}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#infrastructure_encryption_enabled}}infrastructure_encryption_enabled       = {{{infrastructure_encryption_enabled}}}{{/infrastructure_encryption_enabled}}
  {{#local_auth_enabled}}local_auth_enabled                      = {{{local_auth_enabled}}}{{/local_auth_enabled}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#minimum_tls_version}}minimum_tls_version                     = {{{minimum_tls_version}}}{{/minimum_tls_version}}
  {{#network_rule_config}}network_rule_config                     = {{{network_rule_config}}}{{/network_rule_config}}
  {{#premium_messaging_partitions}}premium_messaging_partitions            = {{{premium_messaging_partitions}}}{{/premium_messaging_partitions}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#queues}}queues                                  = {{{queues}}}{{/queues}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                                     = {{{sku}}}{{/sku}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                = {{{timeouts}}}{{/timeouts}}
  {{#topics}}topics                                  = {{{topics}}}{{/topics}}
}
