terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-sql-managedinstance" {
  source  = "Azure/avm-res-sql-managedinstance/azurerm"
  version = "0.3.1"

  {{#administrator_login}}administrator_login                     = {{{administrator_login}}}{{/administrator_login}}
  {{#administrator_login_password}}administrator_login_password            = {{{administrator_login_password}}}{{/administrator_login_password}}
  {{#license_type}}license_type                            = {{{license_type}}}{{/license_type}}
  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#sku_name}}sku_name                                = {{{sku_name}}}{{/sku_name}}
  {{#storage_size_in_gb}}storage_size_in_gb                      = {{{storage_size_in_gb}}}{{/storage_size_in_gb}}
  {{#subnet_id}}subnet_id                               = {{{subnet_id}}}{{/subnet_id}}
  {{#vcores}}vcores                                  = {{{vcores}}}{{/vcores}}
  {{#active_directory_administrator}}active_directory_administrator          = {{{active_directory_administrator}}}{{/active_directory_administrator}}
  {{#advanced_threat_protection_enabled}}advanced_threat_protection_enabled      = {{{advanced_threat_protection_enabled}}}{{/advanced_threat_protection_enabled}}
  {{#collation}}collation                               = {{{collation}}}{{/collation}}
  {{#database_format}}database_format                         = {{{database_format}}}{{/database_format}}
  {{#databases}}databases                               = {{{databases}}}{{/databases}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#dns_zone_partner_id}}dns_zone_partner_id                     = {{{dns_zone_partner_id}}}{{/dns_zone_partner_id}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#failover_group}}failover_group                          = {{{failover_group}}}{{/failover_group}}
  {{#is_general_purpose_v2}}is_general_purpose_v2                   = {{{is_general_purpose_v2}}}{{/is_general_purpose_v2}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#maintenance_configuration_name}}maintenance_configuration_name          = {{{maintenance_configuration_name}}}{{/maintenance_configuration_name}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#memory_size_in_gb}}memory_size_in_gb                       = {{{memory_size_in_gb}}}{{/memory_size_in_gb}}
  {{#minimum_tls_version}}minimum_tls_version                     = {{{minimum_tls_version}}}{{/minimum_tls_version}}
  {{#pricing_model}}pricing_model                           = {{{pricing_model}}}{{/pricing_model}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#proxy_override}}proxy_override                          = {{{proxy_override}}}{{/proxy_override}}
  {{#public_data_endpoint_enabled}}public_data_endpoint_enabled            = {{{public_data_endpoint_enabled}}}{{/public_data_endpoint_enabled}}
  {{#retry}}retry                                   = {{{retry}}}{{/retry}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#security_alert_policy}}security_alert_policy                   = {{{security_alert_policy}}}{{/security_alert_policy}}
  {{#service_principal_enabled}}service_principal_enabled               = {{{service_principal_enabled}}}{{/service_principal_enabled}}
  {{#storage_account_resource_id}}storage_account_resource_id             = {{{storage_account_resource_id}}}{{/storage_account_resource_id}}
  {{#storage_account_type}}storage_account_type                    = {{{storage_account_type}}}{{/storage_account_type}}
  {{#storage_iops}}storage_iops                            = {{{storage_iops}}}{{/storage_iops}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#timeout}}timeout                                 = {{{timeout}}}{{/timeout}}
  {{#timeouts}}timeouts                                = {{{timeouts}}}{{/timeouts}}
  {{#timezone_id}}timezone_id                             = {{{timezone_id}}}{{/timezone_id}}
  {{#transparent_data_encryption}}transparent_data_encryption             = {{{transparent_data_encryption}}}{{/transparent_data_encryption}}
  {{#vulnerability_assessment}}vulnerability_assessment                = {{{vulnerability_assessment}}}{{/vulnerability_assessment}}
  {{#zone_redundant_enabled}}zone_redundant_enabled                  = {{{zone_redundant_enabled}}}{{/zone_redundant_enabled}}
}
