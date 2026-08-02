terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_sql_managedinstance" {
  source  = "Azure/avm-res-sql-managedinstance/azurerm"
  version = "0.3.1"

  {{#if administrator_login}}administrator_login                     = {{hclVal administrator_login}}{{/if}}
  {{#if administrator_login_password}}administrator_login_password            = {{hclVal administrator_login_password}}{{/if}}
  {{#if license_type}}license_type                            = {{hclVal license_type}}{{/if}}
  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if sku_name}}sku_name                                = {{hclVal sku_name}}{{/if}}
  {{#if storage_size_in_gb}}storage_size_in_gb                      = {{hclVal storage_size_in_gb}}{{/if}}
  {{#if subnet_id}}subnet_id                               = {{hclVal subnet_id}}{{/if}}
  {{#if vcores}}vcores                                  = {{hclVal vcores}}{{/if}}
  {{#if active_directory_administrator}}active_directory_administrator          = {{hclVal active_directory_administrator}}{{/if}}
  {{#if advanced_threat_protection_enabled}}advanced_threat_protection_enabled      = {{hclVal advanced_threat_protection_enabled}}{{/if}}
  {{#if collation}}collation                               = {{hclVal collation}}{{/if}}
  {{#if database_format}}database_format                         = {{hclVal database_format}}{{/if}}
  {{#if databases}}databases                               = {{hclVal databases}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if dns_zone_partner_id}}dns_zone_partner_id                     = {{hclVal dns_zone_partner_id}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if failover_group}}failover_group                          = {{hclVal failover_group}}{{/if}}
  {{#if is_general_purpose_v2}}is_general_purpose_v2                   = {{hclVal is_general_purpose_v2}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if maintenance_configuration_name}}maintenance_configuration_name          = {{hclVal maintenance_configuration_name}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if memory_size_in_gb}}memory_size_in_gb                       = {{hclVal memory_size_in_gb}}{{/if}}
  {{#if minimum_tls_version}}minimum_tls_version                     = {{hclVal minimum_tls_version}}{{/if}}
  {{#if pricing_model}}pricing_model                           = {{hclVal pricing_model}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if proxy_override}}proxy_override                          = {{hclVal proxy_override}}{{/if}}
  {{#if public_data_endpoint_enabled}}public_data_endpoint_enabled            = {{hclVal public_data_endpoint_enabled}}{{/if}}
  {{#if retry}}retry                                   = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if security_alert_policy}}security_alert_policy                   = {{hclVal security_alert_policy}}{{/if}}
  {{#if service_principal_enabled}}service_principal_enabled               = {{hclVal service_principal_enabled}}{{/if}}
  {{#if storage_account_resource_id}}storage_account_resource_id             = {{hclVal storage_account_resource_id}}{{/if}}
  {{#if storage_account_type}}storage_account_type                    = {{hclVal storage_account_type}}{{/if}}
  {{#if storage_iops}}storage_iops                            = {{hclVal storage_iops}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if timeout}}timeout                                 = {{hclVal timeout}}{{/if}}
  {{#if timezone_id}}timezone_id                             = {{hclVal timezone_id}}{{/if}}
  {{#if transparent_data_encryption}}transparent_data_encryption             = {{hclVal transparent_data_encryption}}{{/if}}
  {{#if vulnerability_assessment}}vulnerability_assessment                = {{hclVal vulnerability_assessment}}{{/if}}
  {{#if zone_redundant_enabled}}zone_redundant_enabled                  = {{hclVal zone_redundant_enabled}}{{/if}}
}
