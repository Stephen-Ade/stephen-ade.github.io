terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-devcenter-devcenter" {
  source  = "Azure/avm-res-devcenter-devcenter/azurerm"
  version = "0.1.1"

  {{#if dev_center_name}}dev_center_name     = {{hclVal dev_center_name}}{{/if}}
  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if dev_center_identity}}dev_center_identity = {{hclVal dev_center_identity}}{{/if}}
  {{#if dev_center_timeouts}}dev_center_timeouts = {{hclVal dev_center_timeouts}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments    = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
}
