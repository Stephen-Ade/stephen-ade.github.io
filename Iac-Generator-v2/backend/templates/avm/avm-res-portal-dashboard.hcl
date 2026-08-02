terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_portal_dashboard" {
  source  = "Azure/avm-res-portal-dashboard/azurerm"
  version = "0.1.0"

  {{#if location}}location                = {{hclVal location}}{{/if}}
  {{#if name}}name                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name     = {{hclVal resource_group_name}}{{/if}}
  {{#if template_file_path}}template_file_path      = {{hclVal template_file_path}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry        = {{hclVal enable_telemetry}}{{/if}}
  {{#if tags}}tags                    = {{hclVal tags}}{{/if}}
  {{#if template_file_variables}}template_file_variables = {{hclVal template_file_variables}}{{/if}}
}
