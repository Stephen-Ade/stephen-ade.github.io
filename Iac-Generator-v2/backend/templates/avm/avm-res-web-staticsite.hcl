terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_web_staticsite" {
  source  = "Azure/avm-res-web-staticsite/azurerm"
  version = "0.6.2"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if all_child_resources_inherit_lock}}all_child_resources_inherit_lock        = {{hclVal all_child_resources_inherit_lock}}{{/if}}
  {{#if all_child_resources_inherit_tags}}all_child_resources_inherit_tags        = {{hclVal all_child_resources_inherit_tags}}{{/if}}
  {{#if app_settings}}app_settings                            = {{hclVal app_settings}}{{/if}}
  {{#if basic_auth}}basic_auth                              = {{hclVal basic_auth}}{{/if}}
  {{#if basic_auth_enabled}}basic_auth_enabled                      = {{hclVal basic_auth_enabled}}{{/if}}
  {{#if branch}}branch                                  = {{hclVal branch}}{{/if}}
  {{#if configuration_file_changes_enabled}}configuration_file_changes_enabled      = {{hclVal configuration_file_changes_enabled}}{{/if}}
  {{#if custom_domains}}custom_domains                          = {{hclVal custom_domains}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if preview_environments_enabled}}preview_environments_enabled            = {{hclVal preview_environments_enabled}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_inherit_lock}}private_endpoints_inherit_lock          = {{hclVal private_endpoints_inherit_lock}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if repository_url}}repository_url                          = {{hclVal repository_url}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if sku_size}}sku_size                                = {{hclVal sku_size}}{{/if}}
  {{#if sku_tier}}sku_tier                                = {{hclVal sku_tier}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
}
