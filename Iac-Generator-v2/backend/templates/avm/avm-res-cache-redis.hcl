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

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#access_keys_authentication_enabled}}access_keys_authentication_enabled      = {{{access_keys_authentication_enabled}}}{{/access_keys_authentication_enabled}}
  {{#cache_access_policies}}cache_access_policies                   = {{{cache_access_policies}}}{{/cache_access_policies}}
  {{#cache_access_policy_assignments}}cache_access_policy_assignments         = {{{cache_access_policy_assignments}}}{{/cache_access_policy_assignments}}
  {{#cache_firewall_rules}}cache_firewall_rules                    = {{{cache_firewall_rules}}}{{/cache_firewall_rules}}
  {{#capacity}}capacity                                = {{{capacity}}}{{/capacity}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_non_ssl_port}}enable_non_ssl_port                     = {{{enable_non_ssl_port}}}{{/enable_non_ssl_port}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#linked_redis_caches}}linked_redis_caches                     = {{{linked_redis_caches}}}{{/linked_redis_caches}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#minimum_tls_version}}minimum_tls_version                     = {{{minimum_tls_version}}}{{/minimum_tls_version}}
  {{#patch_schedule}}patch_schedule                          = {{{patch_schedule}}}{{/patch_schedule}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#private_static_ip_address}}private_static_ip_address               = {{{private_static_ip_address}}}{{/private_static_ip_address}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#redis_configuration}}redis_configuration                     = {{{redis_configuration}}}{{/redis_configuration}}
  {{#redis_version}}redis_version                           = {{{redis_version}}}{{/redis_version}}
  {{#replicas_per_master}}replicas_per_master                     = {{{replicas_per_master}}}{{/replicas_per_master}}
  {{#replicas_per_primary}}replicas_per_primary                    = {{{replicas_per_primary}}}{{/replicas_per_primary}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#shard_count}}shard_count                             = {{{shard_count}}}{{/shard_count}}
  {{#sku_name}}sku_name                                = {{{sku_name}}}{{/sku_name}}
  {{#subnet_resource_id}}subnet_resource_id                      = {{{subnet_resource_id}}}{{/subnet_resource_id}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#tenant_settings}}tenant_settings                         = {{{tenant_settings}}}{{/tenant_settings}}
  {{#zones}}zones                                   = {{{zones}}}{{/zones}}
}
