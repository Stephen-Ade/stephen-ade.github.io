terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_cache_redisenterprise" {
  source  = "Azure/avm-res-cache-redisenterprise/azurerm"
  version = "0.2.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                               = {{hclVal parent_id}}{{/if}}
  {{#if sku_name}}sku_name                                = {{hclVal sku_name}}{{/if}}
  {{#if access_policy_assignments}}access_policy_assignments               = {{hclVal access_policy_assignments}}{{/if}}
  {{#if clustering_policy}}clustering_policy                       = {{hclVal clustering_policy}}{{/if}}
  {{#if customer_managed_key_encryption}}customer_managed_key_encryption         = {{hclVal customer_managed_key_encryption}}{{/if}}
  {{#if enable_non_ssl_port}}enable_non_ssl_port                     = {{hclVal enable_non_ssl_port}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if eviction_policy}}eviction_policy                         = {{hclVal eviction_policy}}{{/if}}
  {{#if high_availability}}high_availability                       = {{hclVal high_availability}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if minimum_tls_version}}minimum_tls_version                     = {{hclVal minimum_tls_version}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access}}public_network_access                   = {{hclVal public_network_access}}{{/if}}
  {{#if redis_modules}}redis_modules                           = {{hclVal redis_modules}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                = {{hclVal timeouts}}{{/if}}
  {{#if zones}}zones                                   = {{hclVal zones}}{{/if}}
}
