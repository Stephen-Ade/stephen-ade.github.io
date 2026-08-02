terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_oracledatabase_cloudexadatainfrastructure" {
  source  = "Azure/avm-res-oracledatabase-cloudexadatainfrastructure/azurerm"
  version = "0.3.2"

  {{#if compute_count}}compute_count                        = {{hclVal compute_count}}{{/if}}
  {{#if display_name}}display_name                         = {{hclVal display_name}}{{/if}}
  {{#if location}}location                             = {{hclVal location}}{{/if}}
  {{#if name}}name                                 = {{hclVal name}}{{/if}}
  {{#if resource_group_id}}resource_group_id                    = {{hclVal resource_group_id}}{{/if}}
  {{#if storage_count}}storage_count                        = {{hclVal storage_count}}{{/if}}
  {{#if zone}}zone                                 = {{hclVal zone}}{{/if}}
  {{#if custom_action_timeout_in_mins}}custom_action_timeout_in_mins        = {{hclVal custom_action_timeout_in_mins}}{{/if}}
  {{#if customer_contacts}}customer_contacts                    = {{hclVal customer_contacts}}{{/if}}
  {{#if database_server_type}}database_server_type                 = {{hclVal database_server_type}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                     = {{hclVal enable_telemetry}}{{/if}}
  {{#if is_custom_action_timeout_enabled}}is_custom_action_timeout_enabled     = {{hclVal is_custom_action_timeout_enabled}}{{/if}}
  {{#if maintenance_window_days_of_week}}maintenance_window_days_of_week      = {{hclVal maintenance_window_days_of_week}}{{/if}}
  {{#if maintenance_window_hours_of_day}}maintenance_window_hours_of_day      = {{hclVal maintenance_window_hours_of_day}}{{/if}}
  {{#if maintenance_window_leadtime_in_weeks}}maintenance_window_leadtime_in_weeks = {{hclVal maintenance_window_leadtime_in_weeks}}{{/if}}
  {{#if maintenance_window_months}}maintenance_window_months            = {{hclVal maintenance_window_months}}{{/if}}
  {{#if maintenance_window_patching_mode}}maintenance_window_patching_mode     = {{hclVal maintenance_window_patching_mode}}{{/if}}
  {{#if maintenance_window_preference}}maintenance_window_preference        = {{hclVal maintenance_window_preference}}{{/if}}
  {{#if maintenance_window_weeks_of_month}}maintenance_window_weeks_of_month    = {{hclVal maintenance_window_weeks_of_month}}{{/if}}
  {{#if role_assignments}}role_assignments                     = {{hclVal role_assignments}}{{/if}}
  {{#if shape}}shape                                = {{hclVal shape}}{{/if}}
  {{#if storage_server_type}}storage_server_type                  = {{hclVal storage_server_type}}{{/if}}
  {{#if tags}}tags                                 = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                             = {{hclVal timeouts}}{{/if}}
}
