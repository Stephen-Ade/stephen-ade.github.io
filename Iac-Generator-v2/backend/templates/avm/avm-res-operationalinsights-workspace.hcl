terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-operationalinsights-workspace" {
  source  = "Azure/avm-res-operationalinsights-workspace/azurerm"
  version = "0.5.1"

  {{#if location}}location                                                   = {{hclVal location}}{{/if}}
  {{#if name}}name                                                       = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                                        = {{hclVal resource_group_name}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                                        = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                           = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                                       = {{hclVal lock}}{{/if}}
  {{#if log_analytics_workspace_allow_resource_only_permissions}}log_analytics_workspace_allow_resource_only_permissions    = {{hclVal log_analytics_workspace_allow_resource_only_permissions}}{{/if}}
  {{#if log_analytics_workspace_cmk_for_query_forced}}log_analytics_workspace_cmk_for_query_forced               = {{hclVal log_analytics_workspace_cmk_for_query_forced}}{{/if}}
  {{#if log_analytics_workspace_daily_quota_gb}}log_analytics_workspace_daily_quota_gb                     = {{hclVal log_analytics_workspace_daily_quota_gb}}{{/if}}
  {{#if log_analytics_workspace_data_exports}}log_analytics_workspace_data_exports                       = {{hclVal log_analytics_workspace_data_exports}}{{/if}}
  {{#if log_analytics_workspace_dedicated_cluster_resource_id}}log_analytics_workspace_dedicated_cluster_resource_id      = {{hclVal log_analytics_workspace_dedicated_cluster_resource_id}}{{/if}}
  {{#if log_analytics_workspace_identity}}log_analytics_workspace_identity                           = {{hclVal log_analytics_workspace_identity}}{{/if}}
  {{#if log_analytics_workspace_internet_ingestion_enabled}}log_analytics_workspace_internet_ingestion_enabled         = {{hclVal log_analytics_workspace_internet_ingestion_enabled}}{{/if}}
  {{#if log_analytics_workspace_internet_query_enabled}}log_analytics_workspace_internet_query_enabled             = {{hclVal log_analytics_workspace_internet_query_enabled}}{{/if}}
  {{#if log_analytics_workspace_linked_storage_accounts}}log_analytics_workspace_linked_storage_accounts            = {{hclVal log_analytics_workspace_linked_storage_accounts}}{{/if}}
  {{#if log_analytics_workspace_local_authentication_enabled}}log_analytics_workspace_local_authentication_enabled       = {{hclVal log_analytics_workspace_local_authentication_enabled}}{{/if}}
  {{#if log_analytics_workspace_reservation_capacity_in_gb_per_day}}log_analytics_workspace_reservation_capacity_in_gb_per_day = {{hclVal log_analytics_workspace_reservation_capacity_in_gb_per_day}}{{/if}}
  {{#if log_analytics_workspace_retention_in_days}}log_analytics_workspace_retention_in_days                  = {{hclVal log_analytics_workspace_retention_in_days}}{{/if}}
  {{#if log_analytics_workspace_sku}}log_analytics_workspace_sku                                = {{hclVal log_analytics_workspace_sku}}{{/if}}
  {{#if log_analytics_workspace_tables}}log_analytics_workspace_tables                             = {{hclVal log_analytics_workspace_tables}}{{/if}}
  {{#if log_analytics_workspace_tables_update}}log_analytics_workspace_tables_update                      = {{hclVal log_analytics_workspace_tables_update}}{{/if}}
  {{#if log_analytics_workspace_timeouts}}log_analytics_workspace_timeouts                           = {{hclVal log_analytics_workspace_timeouts}}{{/if}}
  {{#if monitor_private_link_scope}}monitor_private_link_scope                                 = {{hclVal monitor_private_link_scope}}{{/if}}
  {{#if monitor_private_link_scoped_resource}}monitor_private_link_scoped_resource                       = {{hclVal monitor_private_link_scoped_resource}}{{/if}}
  {{#if monitor_private_link_scoped_service_name}}monitor_private_link_scoped_service_name                   = {{hclVal monitor_private_link_scoped_service_name}}{{/if}}
  {{#if network_security_perimeter_association}}network_security_perimeter_association                     = {{hclVal network_security_perimeter_association}}{{/if}}
  {{#if private_endpoint_extensions}}private_endpoint_extensions                                = {{hclVal private_endpoint_extensions}}{{/if}}
  {{#if private_endpoints}}private_endpoints                                          = {{hclVal private_endpoints}}{{/if}}
  {{#if role_assignments}}role_assignments                                           = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                                       = {{hclVal tags}}{{/if}}
}
