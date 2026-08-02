terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-cache-redisenterprise" {
  source  = "Azure/avm-res-cache-redisenterprise/azurerm"
  version = "0.2.0"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                               = {{{parent_id}}}{{/parent_id}}
  {{#sku_name}}sku_name                                = {{{sku_name}}}{{/sku_name}}
  {{#access_policy_assignments}}access_policy_assignments               = {{{access_policy_assignments}}}{{/access_policy_assignments}}
  {{#clustering_policy}}clustering_policy                       = {{{clustering_policy}}}{{/clustering_policy}}
  {{#customer_managed_key_encryption}}customer_managed_key_encryption         = {{{customer_managed_key_encryption}}}{{/customer_managed_key_encryption}}
  {{#enable_non_ssl_port}}enable_non_ssl_port                     = {{{enable_non_ssl_port}}}{{/enable_non_ssl_port}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#eviction_policy}}eviction_policy                         = {{{eviction_policy}}}{{/eviction_policy}}
  {{#high_availability}}high_availability                       = {{{high_availability}}}{{/high_availability}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#minimum_tls_version}}minimum_tls_version                     = {{{minimum_tls_version}}}{{/minimum_tls_version}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access}}public_network_access                   = {{{public_network_access}}}{{/public_network_access}}
  {{#redis_modules}}redis_modules                           = {{{redis_modules}}}{{/redis_modules}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                = {{{timeouts}}}{{/timeouts}}
  {{#zones}}zones                                   = {{{zones}}}{{/zones}}
}
