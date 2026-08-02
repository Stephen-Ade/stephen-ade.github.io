terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_sql_server" {
  source  = "Azure/avm-res-sql-server/azurerm"
  version = "0.2.1"

  {{#if location}}location                                             = {{hclVal location}}{{/if}}
  {{#if resource_group_name}}resource_group_name                                  = {{hclVal resource_group_name}}{{/if}}
  {{#if server_version}}server_version                                       = {{hclVal server_version}}{{/if}}
  {{#if administrator_login}}administrator_login                                  = {{hclVal administrator_login}}{{/if}}
  {{#if administrator_login_password}}administrator_login_password                         = {{hclVal administrator_login_password}}{{/if}}
  {{#if administrator_login_password_key_vault_configuration}}administrator_login_password_key_vault_configuration = {{hclVal administrator_login_password_key_vault_configuration}}{{/if}}
  {{#if administrator_login_password_wo}}administrator_login_password_wo                      = {{hclVal administrator_login_password_wo}}{{/if}}
  {{#if administrator_login_password_wo_version}}administrator_login_password_wo_version              = {{hclVal administrator_login_password_wo_version}}{{/if}}
  {{#if azuread_administrator}}azuread_administrator                                = {{hclVal azuread_administrator}}{{/if}}
  {{#if connection_policy}}connection_policy                                    = {{hclVal connection_policy}}{{/if}}
  {{#if databases}}databases                                            = {{hclVal databases}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                                  = {{hclVal diagnostic_settings}}{{/if}}
  {{#if elastic_pools}}elastic_pools                                        = {{hclVal elastic_pools}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                     = {{hclVal enable_telemetry}}{{/if}}
  {{#if express_vulnerability_assessment_enabled}}express_vulnerability_assessment_enabled             = {{hclVal express_vulnerability_assessment_enabled}}{{/if}}
  {{#if firewall_rules}}firewall_rules                                       = {{hclVal firewall_rules}}{{/if}}
  {{#if generate_administrator_login_password}}generate_administrator_login_password                = {{hclVal generate_administrator_login_password}}{{/if}}
  {{#if lock}}lock                                                 = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                                   = {{hclVal managed_identities}}{{/if}}
  {{#if name}}name                                                 = {{hclVal name}}{{/if}}
  {{#if outbound_network_restriction_enabled}}outbound_network_restriction_enabled                 = {{hclVal outbound_network_restriction_enabled}}{{/if}}
  {{#if primary_user_assigned_identity_id}}primary_user_assigned_identity_id                    = {{hclVal primary_user_assigned_identity_id}}{{/if}}
  {{#if private_endpoints}}private_endpoints                                    = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group              = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled                        = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                                     = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                                 = {{hclVal tags}}{{/if}}
  {{#if transparent_data_encryption_key_vault_key_id}}transparent_data_encryption_key_vault_key_id         = {{hclVal transparent_data_encryption_key_vault_key_id}}{{/if}}
}
