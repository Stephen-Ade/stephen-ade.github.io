terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-web-staticsite" {
  source  = "Azure/avm-res-web-staticsite/azurerm"
  version = "0.6.2"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#all_child_resources_inherit_lock}}all_child_resources_inherit_lock        = {{{all_child_resources_inherit_lock}}}{{/all_child_resources_inherit_lock}}
  {{#all_child_resources_inherit_tags}}all_child_resources_inherit_tags        = {{{all_child_resources_inherit_tags}}}{{/all_child_resources_inherit_tags}}
  {{#app_settings}}app_settings                            = {{{app_settings}}}{{/app_settings}}
  {{#basic_auth}}basic_auth                              = {{{basic_auth}}}{{/basic_auth}}
  {{#basic_auth_enabled}}basic_auth_enabled                      = {{{basic_auth_enabled}}}{{/basic_auth_enabled}}
  {{#branch}}branch                                  = {{{branch}}}{{/branch}}
  {{#configuration_file_changes_enabled}}configuration_file_changes_enabled      = {{{configuration_file_changes_enabled}}}{{/configuration_file_changes_enabled}}
  {{#custom_domains}}custom_domains                          = {{{custom_domains}}}{{/custom_domains}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#preview_environments_enabled}}preview_environments_enabled            = {{{preview_environments_enabled}}}{{/preview_environments_enabled}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_inherit_lock}}private_endpoints_inherit_lock          = {{{private_endpoints_inherit_lock}}}{{/private_endpoints_inherit_lock}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#repository_url}}repository_url                          = {{{repository_url}}}{{/repository_url}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#sku_size}}sku_size                                = {{{sku_size}}}{{/sku_size}}
  {{#sku_tier}}sku_tier                                = {{{sku_tier}}}{{/sku_tier}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
}
