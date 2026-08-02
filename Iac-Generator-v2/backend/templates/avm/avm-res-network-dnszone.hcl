terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_dnszone" {
  source  = "Azure/avm-res-network-dnszone/azurerm"
  version = "0.2.1"

  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if a_records}}a_records           = {{hclVal a_records}}{{/if}}
  {{#if aaaa_records}}aaaa_records        = {{hclVal aaaa_records}}{{/if}}
  {{#if caa_records}}caa_records         = {{hclVal caa_records}}{{/if}}
  {{#if cname_records}}cname_records       = {{hclVal cname_records}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if mx_records}}mx_records          = {{hclVal mx_records}}{{/if}}
  {{#if ns_records}}ns_records          = {{hclVal ns_records}}{{/if}}
  {{#if ptr_records}}ptr_records         = {{hclVal ptr_records}}{{/if}}
  {{#if srv_records}}srv_records         = {{hclVal srv_records}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
  {{#if txt_records}}txt_records         = {{hclVal txt_records}}{{/if}}
}
