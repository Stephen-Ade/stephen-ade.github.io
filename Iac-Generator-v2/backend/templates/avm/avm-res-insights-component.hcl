terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-insights-component" {
  source  = "Azure/avm-res-insights-component/azurerm"
  version = "0.4.0"

  {{#if location}}location                              = {{hclVal location}}{{/if}}
  {{#if name}}name                                  = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                   = {{hclVal resource_group_name}}{{/if}}
  {{#if workspace_id}}workspace_id                          = {{hclVal workspace_id}}{{/if}}
  {{#if application_type}}application_type                      = {{hclVal application_type}}{{/if}}
  {{#if daily_data_cap_in_gb}}daily_data_cap_in_gb                  = {{hclVal daily_data_cap_in_gb}}{{/if}}
  {{#if daily_data_cap_notifications_disabled}}daily_data_cap_notifications_disabled = {{hclVal daily_data_cap_notifications_disabled}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                   = {{hclVal diagnostic_settings}}{{/if}}
  {{#if disable_ip_masking}}disable_ip_masking                    = {{hclVal disable_ip_masking}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                      = {{hclVal enable_telemetry}}{{/if}}
  {{#if force_customer_storage_for_profiler}}force_customer_storage_for_profiler   = {{hclVal force_customer_storage_for_profiler}}{{/if}}
  {{#if internet_ingestion_enabled}}internet_ingestion_enabled            = {{hclVal internet_ingestion_enabled}}{{/if}}
  {{#if internet_query_enabled}}internet_query_enabled                = {{hclVal internet_query_enabled}}{{/if}}
  {{#if linked_storage_account}}linked_storage_account                = {{hclVal linked_storage_account}}{{/if}}
  {{#if local_authentication_disabled}}local_authentication_disabled         = {{hclVal local_authentication_disabled}}{{/if}}
  {{#if lock}}lock                                  = {{hclVal lock}}{{/if}}
  {{#if monitor_private_link_scope}}monitor_private_link_scope            = {{hclVal monitor_private_link_scope}}{{/if}}
  {{#if retention_in_days}}retention_in_days                     = {{hclVal retention_in_days}}{{/if}}
  {{#if retry}}retry                                 = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments                      = {{hclVal role_assignments}}{{/if}}
  {{#if sampling_percentage}}sampling_percentage                   = {{hclVal sampling_percentage}}{{/if}}
  {{#if tags}}tags                                  = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                              = {{hclVal timeouts}}{{/if}}
}
