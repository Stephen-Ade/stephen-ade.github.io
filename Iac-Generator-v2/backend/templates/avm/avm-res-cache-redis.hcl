terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-cache-redis" {
  source  = "Azure/avm-res-cache-redis/azurerm"
  version = "0.4.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if access_keys_authentication_enabled}}access_keys_authentication_enabled      = {{hclVal access_keys_authentication_enabled}}{{/if}}
  {{#if cache_access_policies}}cache_access_policies                   = {{hclVal cache_access_policies}}{{/if}}
  {{#if cache_access_policy_assignments}}cache_access_policy_assignments         = {{hclVal cache_access_policy_assignments}}{{/if}}
  {{#if cache_firewall_rules}}cache_firewall_rules                    = {{hclVal cache_firewall_rules}}{{/if}}
  {{#if capacity}}capacity                                = {{hclVal capacity}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_non_ssl_port}}enable_non_ssl_port                     = {{hclVal enable_non_ssl_port}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if linked_redis_caches}}linked_redis_caches                     = {{hclVal linked_redis_caches}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if minimum_tls_version}}minimum_tls_version                     = {{hclVal minimum_tls_version}}{{/if}}
  {{#if patch_schedule}}patch_schedule                          = {{hclVal patch_schedule}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if private_static_ip_address}}private_static_ip_address               = {{hclVal private_static_ip_address}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if redis_configuration}}redis_configuration                     = {{hclVal redis_configuration}}{{/if}}
  {{#if redis_version}}redis_version                           = {{hclVal redis_version}}{{/if}}
  {{#if replicas_per_master}}replicas_per_master                     = {{hclVal replicas_per_master}}{{/if}}
  {{#if replicas_per_primary}}replicas_per_primary                    = {{hclVal replicas_per_primary}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if shard_count}}shard_count                             = {{hclVal shard_count}}{{/if}}
  {{#if sku_name}}sku_name                                = {{hclVal sku_name}}{{/if}}
  {{#if subnet_resource_id}}subnet_resource_id                      = {{hclVal subnet_resource_id}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if tenant_settings}}tenant_settings                         = {{hclVal tenant_settings}}{{/if}}
  {{#if zones}}zones                                   = {{hclVal zones}}{{/if}}
}
