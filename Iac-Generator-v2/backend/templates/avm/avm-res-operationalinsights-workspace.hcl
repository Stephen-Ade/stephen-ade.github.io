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

  {{#location}}location                                                   = {{{location}}}{{/location}}
  {{#name}}name                                                       = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                                        = {{{resource_group_name}}}{{/resource_group_name}}
  {{#diagnostic_settings}}diagnostic_settings                                        = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                                           = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                                       = {{{lock}}}{{/lock}}
  {{#log_analytics_workspace_allow_resource_only_permissions}}log_analytics_workspace_allow_resource_only_permissions    = {{{log_analytics_workspace_allow_resource_only_permissions}}}{{/log_analytics_workspace_allow_resource_only_permissions}}
  {{#log_analytics_workspace_cmk_for_query_forced}}log_analytics_workspace_cmk_for_query_forced               = {{{log_analytics_workspace_cmk_for_query_forced}}}{{/log_analytics_workspace_cmk_for_query_forced}}
  {{#log_analytics_workspace_daily_quota_gb}}log_analytics_workspace_daily_quota_gb                     = {{{log_analytics_workspace_daily_quota_gb}}}{{/log_analytics_workspace_daily_quota_gb}}
  {{#log_analytics_workspace_data_exports}}log_analytics_workspace_data_exports                       = {{{log_analytics_workspace_data_exports}}}{{/log_analytics_workspace_data_exports}}
  {{#log_analytics_workspace_dedicated_cluster_resource_id}}log_analytics_workspace_dedicated_cluster_resource_id      = {{{log_analytics_workspace_dedicated_cluster_resource_id}}}{{/log_analytics_workspace_dedicated_cluster_resource_id}}
  {{#log_analytics_workspace_identity}}log_analytics_workspace_identity                           = {{{log_analytics_workspace_identity}}}{{/log_analytics_workspace_identity}}
  {{#log_analytics_workspace_internet_ingestion_enabled}}log_analytics_workspace_internet_ingestion_enabled         = {{{log_analytics_workspace_internet_ingestion_enabled}}}{{/log_analytics_workspace_internet_ingestion_enabled}}
  {{#log_analytics_workspace_internet_query_enabled}}log_analytics_workspace_internet_query_enabled             = {{{log_analytics_workspace_internet_query_enabled}}}{{/log_analytics_workspace_internet_query_enabled}}
  {{#log_analytics_workspace_linked_storage_accounts}}log_analytics_workspace_linked_storage_accounts            = {{{log_analytics_workspace_linked_storage_accounts}}}{{/log_analytics_workspace_linked_storage_accounts}}
  {{#log_analytics_workspace_local_authentication_enabled}}log_analytics_workspace_local_authentication_enabled       = {{{log_analytics_workspace_local_authentication_enabled}}}{{/log_analytics_workspace_local_authentication_enabled}}
  {{#log_analytics_workspace_reservation_capacity_in_gb_per_day}}log_analytics_workspace_reservation_capacity_in_gb_per_day = {{{log_analytics_workspace_reservation_capacity_in_gb_per_day}}}{{/log_analytics_workspace_reservation_capacity_in_gb_per_day}}
  {{#log_analytics_workspace_retention_in_days}}log_analytics_workspace_retention_in_days                  = {{{log_analytics_workspace_retention_in_days}}}{{/log_analytics_workspace_retention_in_days}}
  {{#log_analytics_workspace_sku}}log_analytics_workspace_sku                                = {{{log_analytics_workspace_sku}}}{{/log_analytics_workspace_sku}}
  {{#log_analytics_workspace_tables}}log_analytics_workspace_tables                             = {{{log_analytics_workspace_tables}}}{{/log_analytics_workspace_tables}}
  {{#log_analytics_workspace_tables_update}}log_analytics_workspace_tables_update                      = {{{log_analytics_workspace_tables_update}}}{{/log_analytics_workspace_tables_update}}
  {{#log_analytics_workspace_timeouts}}log_analytics_workspace_timeouts                           = {{{log_analytics_workspace_timeouts}}}{{/log_analytics_workspace_timeouts}}
  {{#monitor_private_link_scope}}monitor_private_link_scope                                 = {{{monitor_private_link_scope}}}{{/monitor_private_link_scope}}
  {{#monitor_private_link_scoped_resource}}monitor_private_link_scoped_resource                       = {{{monitor_private_link_scoped_resource}}}{{/monitor_private_link_scoped_resource}}
  {{#monitor_private_link_scoped_service_name}}monitor_private_link_scoped_service_name                   = {{{monitor_private_link_scoped_service_name}}}{{/monitor_private_link_scoped_service_name}}
  {{#network_security_perimeter_association}}network_security_perimeter_association                     = {{{network_security_perimeter_association}}}{{/network_security_perimeter_association}}
  {{#private_endpoint_extensions}}private_endpoint_extensions                                = {{{private_endpoint_extensions}}}{{/private_endpoint_extensions}}
  {{#private_endpoints}}private_endpoints                                          = {{{private_endpoints}}}{{/private_endpoints}}
  {{#role_assignments}}role_assignments                                           = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                                       = {{{tags}}}{{/tags}}
}
