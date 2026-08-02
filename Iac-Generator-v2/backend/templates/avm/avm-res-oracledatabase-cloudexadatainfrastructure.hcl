terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-oracledatabase-cloudexadatainfrastructure" {
  source  = "Azure/avm-res-oracledatabase-cloudexadatainfrastructure/azurerm"
  version = "0.3.2"

  {{#compute_count}}compute_count                        = {{{compute_count}}}{{/compute_count}}
  {{#display_name}}display_name                         = {{{display_name}}}{{/display_name}}
  {{#location}}location                             = {{{location}}}{{/location}}
  {{#name}}name                                 = {{{name}}}{{/name}}
  {{#resource_group_id}}resource_group_id                    = {{{resource_group_id}}}{{/resource_group_id}}
  {{#storage_count}}storage_count                        = {{{storage_count}}}{{/storage_count}}
  {{#zone}}zone                                 = {{{zone}}}{{/zone}}
  {{#custom_action_timeout_in_mins}}custom_action_timeout_in_mins        = {{{custom_action_timeout_in_mins}}}{{/custom_action_timeout_in_mins}}
  {{#customer_contacts}}customer_contacts                    = {{{customer_contacts}}}{{/customer_contacts}}
  {{#database_server_type}}database_server_type                 = {{{database_server_type}}}{{/database_server_type}}
  {{#enable_telemetry}}enable_telemetry                     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#is_custom_action_timeout_enabled}}is_custom_action_timeout_enabled     = {{{is_custom_action_timeout_enabled}}}{{/is_custom_action_timeout_enabled}}
  {{#maintenance_window_days_of_week}}maintenance_window_days_of_week      = {{{maintenance_window_days_of_week}}}{{/maintenance_window_days_of_week}}
  {{#maintenance_window_hours_of_day}}maintenance_window_hours_of_day      = {{{maintenance_window_hours_of_day}}}{{/maintenance_window_hours_of_day}}
  {{#maintenance_window_leadtime_in_weeks}}maintenance_window_leadtime_in_weeks = {{{maintenance_window_leadtime_in_weeks}}}{{/maintenance_window_leadtime_in_weeks}}
  {{#maintenance_window_months}}maintenance_window_months            = {{{maintenance_window_months}}}{{/maintenance_window_months}}
  {{#maintenance_window_patching_mode}}maintenance_window_patching_mode     = {{{maintenance_window_patching_mode}}}{{/maintenance_window_patching_mode}}
  {{#maintenance_window_preference}}maintenance_window_preference        = {{{maintenance_window_preference}}}{{/maintenance_window_preference}}
  {{#maintenance_window_weeks_of_month}}maintenance_window_weeks_of_month    = {{{maintenance_window_weeks_of_month}}}{{/maintenance_window_weeks_of_month}}
  {{#role_assignments}}role_assignments                     = {{{role_assignments}}}{{/role_assignments}}
  {{#shape}}shape                                = {{{shape}}}{{/shape}}
  {{#storage_server_type}}storage_server_type                  = {{{storage_server_type}}}{{/storage_server_type}}
  {{#tags}}tags                                 = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                             = {{{timeouts}}}{{/timeouts}}
}
