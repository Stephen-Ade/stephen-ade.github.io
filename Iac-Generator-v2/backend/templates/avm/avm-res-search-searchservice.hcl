terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_search_searchservice" {
  source  = "Azure/avm-res-search-searchservice/azurerm"
  version = "0.3.0"

  {{#if location}}location                                 = {{hclVal location}}{{/if}}
  {{#if name}}name                                     = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                      = {{hclVal resource_group_name}}{{/if}}
  {{#if allowed_ips}}allowed_ips                              = {{hclVal allowed_ips}}{{/if}}
  {{#if authentication_failure_mode}}authentication_failure_mode              = {{hclVal authentication_failure_mode}}{{/if}}
  {{#if customer_managed_key_enforcement_enabled}}customer_managed_key_enforcement_enabled = {{hclVal customer_managed_key_enforcement_enabled}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                      = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                         = {{hclVal enable_telemetry}}{{/if}}
  {{#if hosting_mode}}hosting_mode                             = {{hclVal hosting_mode}}{{/if}}
  {{#if local_authentication_enabled}}local_authentication_enabled             = {{hclVal local_authentication_enabled}}{{/if}}
  {{#if lock}}lock                                     = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                       = {{hclVal managed_identities}}{{/if}}
  {{#if network_rule_bypass_option}}network_rule_bypass_option               = {{hclVal network_rule_bypass_option}}{{/if}}
  {{#if partition_count}}partition_count                          = {{hclVal partition_count}}{{/if}}
  {{#if private_endpoints}}private_endpoints                        = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group  = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled            = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if replica_count}}replica_count                            = {{hclVal replica_count}}{{/if}}
  {{#if resource_types}}resource_types                           = {{hclVal resource_types}}{{/if}}
  {{#if retry}}retry                                    = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments                         = {{hclVal role_assignments}}{{/if}}
  {{#if semantic_search_sku}}semantic_search_sku                      = {{hclVal semantic_search_sku}}{{/if}}
  {{#if sku}}sku                                      = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                                     = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                 = {{hclVal timeouts}}{{/if}}
}
