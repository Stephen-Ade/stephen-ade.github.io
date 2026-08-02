terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_frontdoorwebapplicationfirewallpolicy" {
  source  = "Azure/avm-res-network-frontdoorwebapplicationfirewallpolicy/azurerm"
  version = "0.1.0"

  {{#if mode}}mode                              = {{hclVal mode}}{{/if}}
  {{#if name}}name                              = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name               = {{hclVal resource_group_name}}{{/if}}
  {{#if sku_name}}sku_name                          = {{hclVal sku_name}}{{/if}}
  {{#if custom_block_response_body}}custom_block_response_body        = {{hclVal custom_block_response_body}}{{/if}}
  {{#if custom_block_response_status_code}}custom_block_response_status_code = {{hclVal custom_block_response_status_code}}{{/if}}
  {{#if custom_rules}}custom_rules                      = {{hclVal custom_rules}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                  = {{hclVal enable_telemetry}}{{/if}}
  {{#if enabled}}enabled                           = {{hclVal enabled}}{{/if}}
  {{#if lock}}lock                              = {{hclVal lock}}{{/if}}
  {{#if managed_rules}}managed_rules                     = {{hclVal managed_rules}}{{/if}}
  {{#if redirect_url}}redirect_url                      = {{hclVal redirect_url}}{{/if}}
  {{#if request_body_check_enabled}}request_body_check_enabled        = {{hclVal request_body_check_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                  = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                              = {{hclVal tags}}{{/if}}
}
