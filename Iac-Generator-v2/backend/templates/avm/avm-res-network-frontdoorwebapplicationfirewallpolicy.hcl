terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-frontdoorwebapplicationfirewallpolicy" {
  source  = "Azure/avm-res-network-frontdoorwebapplicationfirewallpolicy/azurerm"
  version = "0.1.0"

  {{#mode}}mode                              = {{{mode}}}{{/mode}}
  {{#name}}name                              = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name               = {{{resource_group_name}}}{{/resource_group_name}}
  {{#sku_name}}sku_name                          = {{{sku_name}}}{{/sku_name}}
  {{#custom_block_response_body}}custom_block_response_body        = {{{custom_block_response_body}}}{{/custom_block_response_body}}
  {{#custom_block_response_status_code}}custom_block_response_status_code = {{{custom_block_response_status_code}}}{{/custom_block_response_status_code}}
  {{#custom_rules}}custom_rules                      = {{{custom_rules}}}{{/custom_rules}}
  {{#enable_telemetry}}enable_telemetry                  = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#enabled}}enabled                           = {{{enabled}}}{{/enabled}}
  {{#lock}}lock                              = {{{lock}}}{{/lock}}
  {{#managed_rules}}managed_rules                     = {{{managed_rules}}}{{/managed_rules}}
  {{#redirect_url}}redirect_url                      = {{{redirect_url}}}{{/redirect_url}}
  {{#request_body_check_enabled}}request_body_check_enabled        = {{{request_body_check_enabled}}}{{/request_body_check_enabled}}
  {{#role_assignments}}role_assignments                  = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                              = {{{tags}}}{{/tags}}
}
