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

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#tenant_id}}tenant_id                               = {{{tenant_id}}}{{/tenant_id}}
  {{#contacts}}contacts                                = {{{contacts}}}{{/contacts}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#enabled_for_deployment}}enabled_for_deployment                  = {{{enabled_for_deployment}}}{{/enabled_for_deployment}}
  {{#enabled_for_disk_encryption}}enabled_for_disk_encryption             = {{{enabled_for_disk_encryption}}}{{/enabled_for_disk_encryption}}
  {{#enabled_for_template_deployment}}enabled_for_template_deployment         = {{{enabled_for_template_deployment}}}{{/enabled_for_template_deployment}}
  {{#keys}}keys                                    = {{{keys}}}{{/keys}}
  {{#legacy_access_policies}}legacy_access_policies                  = {{{legacy_access_policies}}}{{/legacy_access_policies}}
  {{#legacy_access_policies_enabled}}legacy_access_policies_enabled          = {{{legacy_access_policies_enabled}}}{{/legacy_access_policies_enabled}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#network_acls}}network_acls                            = {{{network_acls}}}{{/network_acls}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#purge_protection_enabled}}purge_protection_enabled                = {{{purge_protection_enabled}}}{{/purge_protection_enabled}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#secrets}}secrets                                 = {{{secrets}}}{{/secrets}}
  {{#secrets_value}}secrets_value                           = {{{secrets_value}}}{{/secrets_value}}
  {{#sku_name}}sku_name                                = {{{sku_name}}}{{/sku_name}}
  {{#soft_delete_retention_days}}soft_delete_retention_days              = {{{soft_delete_retention_days}}}{{/soft_delete_retention_days}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#wait_for_rbac_before_contact_operations}}wait_for_rbac_before_contact_operations = {{{wait_for_rbac_before_contact_operations}}}{{/wait_for_rbac_before_contact_operations}}
  {{#wait_for_rbac_before_key_operations}}wait_for_rbac_before_key_operations     = {{{wait_for_rbac_before_key_operations}}}{{/wait_for_rbac_before_key_operations}}
  {{#wait_for_rbac_before_secret_operations}}wait_for_rbac_before_secret_operations  = {{{wait_for_rbac_before_secret_operations}}}{{/wait_for_rbac_before_secret_operations}}
}
