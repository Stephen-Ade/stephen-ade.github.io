terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-sql-server" {
  source  = "Azure/avm-res-sql-server/azurerm"
  version = "0.2.1"

  {{#location}}location                                             = {{{location}}}{{/location}}
  {{#resource_group_name}}resource_group_name                                  = {{{resource_group_name}}}{{/resource_group_name}}
  {{#server_version}}server_version                                       = {{{server_version}}}{{/server_version}}
  {{#administrator_login}}administrator_login                                  = {{{administrator_login}}}{{/administrator_login}}
  {{#administrator_login_password}}administrator_login_password                         = {{{administrator_login_password}}}{{/administrator_login_password}}
  {{#administrator_login_password_key_vault_configuration}}administrator_login_password_key_vault_configuration = {{{administrator_login_password_key_vault_configuration}}}{{/administrator_login_password_key_vault_configuration}}
  {{#administrator_login_password_wo}}administrator_login_password_wo                      = {{{administrator_login_password_wo}}}{{/administrator_login_password_wo}}
  {{#administrator_login_password_wo_version}}administrator_login_password_wo_version              = {{{administrator_login_password_wo_version}}}{{/administrator_login_password_wo_version}}
  {{#azuread_administrator}}azuread_administrator                                = {{{azuread_administrator}}}{{/azuread_administrator}}
  {{#connection_policy}}connection_policy                                    = {{{connection_policy}}}{{/connection_policy}}
  {{#databases}}databases                                            = {{{databases}}}{{/databases}}
  {{#diagnostic_settings}}diagnostic_settings                                  = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#elastic_pools}}elastic_pools                                        = {{{elastic_pools}}}{{/elastic_pools}}
  {{#enable_telemetry}}enable_telemetry                                     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#express_vulnerability_assessment_enabled}}express_vulnerability_assessment_enabled             = {{{express_vulnerability_assessment_enabled}}}{{/express_vulnerability_assessment_enabled}}
  {{#firewall_rules}}firewall_rules                                       = {{{firewall_rules}}}{{/firewall_rules}}
  {{#generate_administrator_login_password}}generate_administrator_login_password                = {{{generate_administrator_login_password}}}{{/generate_administrator_login_password}}
  {{#lock}}lock                                                 = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                                   = {{{managed_identities}}}{{/managed_identities}}
  {{#name}}name                                                 = {{{name}}}{{/name}}
  {{#outbound_network_restriction_enabled}}outbound_network_restriction_enabled                 = {{{outbound_network_restriction_enabled}}}{{/outbound_network_restriction_enabled}}
  {{#primary_user_assigned_identity_id}}primary_user_assigned_identity_id                    = {{{primary_user_assigned_identity_id}}}{{/primary_user_assigned_identity_id}}
  {{#private_endpoints}}private_endpoints                                    = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group              = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled                        = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                                     = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                                 = {{{tags}}}{{/tags}}
  {{#transparent_data_encryption_key_vault_key_id}}transparent_data_encryption_key_vault_key_id         = {{{transparent_data_encryption_key_vault_key_id}}}{{/transparent_data_encryption_key_vault_key_id}}
}
