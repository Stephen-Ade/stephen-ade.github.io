terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-search-searchservice" {
  source  = "Azure/avm-res-search-searchservice/azurerm"
  version = "0.3.0"

  {{#location}}location                                 = {{{location}}}{{/location}}
  {{#name}}name                                     = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                      = {{{resource_group_name}}}{{/resource_group_name}}
  {{#allowed_ips}}allowed_ips                              = {{{allowed_ips}}}{{/allowed_ips}}
  {{#authentication_failure_mode}}authentication_failure_mode              = {{{authentication_failure_mode}}}{{/authentication_failure_mode}}
  {{#customer_managed_key_enforcement_enabled}}customer_managed_key_enforcement_enabled = {{{customer_managed_key_enforcement_enabled}}}{{/customer_managed_key_enforcement_enabled}}
  {{#diagnostic_settings}}diagnostic_settings                      = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                         = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#hosting_mode}}hosting_mode                             = {{{hosting_mode}}}{{/hosting_mode}}
  {{#local_authentication_enabled}}local_authentication_enabled             = {{{local_authentication_enabled}}}{{/local_authentication_enabled}}
  {{#lock}}lock                                     = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                       = {{{managed_identities}}}{{/managed_identities}}
  {{#network_rule_bypass_option}}network_rule_bypass_option               = {{{network_rule_bypass_option}}}{{/network_rule_bypass_option}}
  {{#partition_count}}partition_count                          = {{{partition_count}}}{{/partition_count}}
  {{#private_endpoints}}private_endpoints                        = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group  = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled            = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#replica_count}}replica_count                            = {{{replica_count}}}{{/replica_count}}
  {{#resource_types}}resource_types                           = {{{resource_types}}}{{/resource_types}}
  {{#retry}}retry                                    = {{{retry}}}{{/retry}}
  {{#role_assignments}}role_assignments                         = {{{role_assignments}}}{{/role_assignments}}
  {{#semantic_search_sku}}semantic_search_sku                      = {{{semantic_search_sku}}}{{/semantic_search_sku}}
  {{#sku}}sku                                      = {{{sku}}}{{/sku}}
  {{#tags}}tags                                     = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                 = {{{timeouts}}}{{/timeouts}}
}
