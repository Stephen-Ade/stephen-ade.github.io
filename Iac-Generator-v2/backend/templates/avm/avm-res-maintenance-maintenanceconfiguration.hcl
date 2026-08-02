terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-maintenance-maintenanceconfiguration" {
  source  = "Azure/avm-res-maintenance-maintenanceconfiguration/azurerm"
  version = "0.1.0"

  {{#if location}}location             = {{hclVal location}}{{/if}}
  {{#if name}}name                 = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name  = {{hclVal resource_group_name}}{{/if}}
  {{#if scope}}scope                = {{hclVal scope}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry     = {{hclVal enable_telemetry}}{{/if}}
  {{#if extension_properties}}extension_properties = {{hclVal extension_properties}}{{/if}}
  {{#if install_patches}}install_patches      = {{hclVal install_patches}}{{/if}}
  {{#if lock}}lock                 = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments     = {{hclVal role_assignments}}{{/if}}
  {{#if subscription_id}}subscription_id      = {{hclVal subscription_id}}{{/if}}
  {{#if tags}}tags                 = {{hclVal tags}}{{/if}}
  {{#if visibility}}visibility           = {{hclVal visibility}}{{/if}}
  {{#if window}}window               = {{hclVal window}}{{/if}}
}
