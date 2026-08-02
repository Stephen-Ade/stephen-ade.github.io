terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_logic_workflow" {
  source  = "Azure/avm-res-logic-workflow/azurerm"
  version = "0.1.2"

  {{#if location}}location                           = {{hclVal location}}{{/if}}
  {{#if name}}name                               = {{hclVal name}}{{/if}}
  {{#if resource_group_id}}resource_group_id                  = {{hclVal resource_group_id}}{{/if}}
  {{#if resource_group_name}}resource_group_name                = {{hclVal resource_group_name}}{{/if}}
  {{#if access_control}}access_control                     = {{hclVal access_control}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                   = {{hclVal enable_telemetry}}{{/if}}
  {{#if endpoints_configuration}}endpoints_configuration            = {{hclVal endpoints_configuration}}{{/if}}
  {{#if integration_account_id}}integration_account_id             = {{hclVal integration_account_id}}{{/if}}
  {{#if integration_service_environment_id}}integration_service_environment_id = {{hclVal integration_service_environment_id}}{{/if}}
  {{#if lock}}lock                               = {{hclVal lock}}{{/if}}
  {{#if logic_app_definition}}logic_app_definition               = {{hclVal logic_app_definition}}{{/if}}
  {{#if managed_identities}}managed_identities                 = {{hclVal managed_identities}}{{/if}}
  {{#if role_assignments}}role_assignments                   = {{hclVal role_assignments}}{{/if}}
  {{#if state}}state                              = {{hclVal state}}{{/if}}
  {{#if tags}}tags                               = {{hclVal tags}}{{/if}}
  {{#if workflow_parameters}}workflow_parameters                = {{hclVal workflow_parameters}}{{/if}}
}
