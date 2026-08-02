terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-keyvault-vault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.2"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if tenant_id}}tenant_id                               = {{hclVal tenant_id}}{{/if}}
  {{#if contacts}}contacts                                = {{hclVal contacts}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if enabled_for_deployment}}enabled_for_deployment                  = {{hclVal enabled_for_deployment}}{{/if}}
  {{#if enabled_for_disk_encryption}}enabled_for_disk_encryption             = {{hclVal enabled_for_disk_encryption}}{{/if}}
  {{#if enabled_for_template_deployment}}enabled_for_template_deployment         = {{hclVal enabled_for_template_deployment}}{{/if}}
  {{#if keys}}keys                                    = {{hclVal keys}}{{/if}}
  {{#if legacy_access_policies}}legacy_access_policies                  = {{hclVal legacy_access_policies}}{{/if}}
  {{#if legacy_access_policies_enabled}}legacy_access_policies_enabled          = {{hclVal legacy_access_policies_enabled}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if network_acls}}network_acls                            = {{hclVal network_acls}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if purge_protection_enabled}}purge_protection_enabled                = {{hclVal purge_protection_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if secrets}}secrets                                 = {{hclVal secrets}}{{/if}}
  {{#if secrets_value}}secrets_value                           = {{hclVal secrets_value}}{{/if}}
  {{#if sku_name}}sku_name                                = {{hclVal sku_name}}{{/if}}
  {{#if soft_delete_retention_days}}soft_delete_retention_days              = {{hclVal soft_delete_retention_days}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if wait_for_rbac_before_contact_operations}}wait_for_rbac_before_contact_operations = {{hclVal wait_for_rbac_before_contact_operations}}{{/if}}
  {{#if wait_for_rbac_before_key_operations}}wait_for_rbac_before_key_operations     = {{hclVal wait_for_rbac_before_key_operations}}{{/if}}
  {{#if wait_for_rbac_before_secret_operations}}wait_for_rbac_before_secret_operations  = {{hclVal wait_for_rbac_before_secret_operations}}{{/if}}
}
