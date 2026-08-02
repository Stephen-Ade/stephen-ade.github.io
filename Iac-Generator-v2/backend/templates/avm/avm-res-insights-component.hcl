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

  {{#location}}location                              = {{{location}}}{{/location}}
  {{#name}}name                                  = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                   = {{{resource_group_name}}}{{/resource_group_name}}
  {{#workspace_id}}workspace_id                          = {{{workspace_id}}}{{/workspace_id}}
  {{#application_type}}application_type                      = {{{application_type}}}{{/application_type}}
  {{#daily_data_cap_in_gb}}daily_data_cap_in_gb                  = {{{daily_data_cap_in_gb}}}{{/daily_data_cap_in_gb}}
  {{#daily_data_cap_notifications_disabled}}daily_data_cap_notifications_disabled = {{{daily_data_cap_notifications_disabled}}}{{/daily_data_cap_notifications_disabled}}
  {{#diagnostic_settings}}diagnostic_settings                   = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#disable_ip_masking}}disable_ip_masking                    = {{{disable_ip_masking}}}{{/disable_ip_masking}}
  {{#enable_telemetry}}enable_telemetry                      = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#force_customer_storage_for_profiler}}force_customer_storage_for_profiler   = {{{force_customer_storage_for_profiler}}}{{/force_customer_storage_for_profiler}}
  {{#internet_ingestion_enabled}}internet_ingestion_enabled            = {{{internet_ingestion_enabled}}}{{/internet_ingestion_enabled}}
  {{#internet_query_enabled}}internet_query_enabled                = {{{internet_query_enabled}}}{{/internet_query_enabled}}
  {{#linked_storage_account}}linked_storage_account                = {{{linked_storage_account}}}{{/linked_storage_account}}
  {{#local_authentication_disabled}}local_authentication_disabled         = {{{local_authentication_disabled}}}{{/local_authentication_disabled}}
  {{#lock}}lock                                  = {{{lock}}}{{/lock}}
  {{#monitor_private_link_scope}}monitor_private_link_scope            = {{{monitor_private_link_scope}}}{{/monitor_private_link_scope}}
  {{#retention_in_days}}retention_in_days                     = {{{retention_in_days}}}{{/retention_in_days}}
  {{#retry}}retry                                 = {{{retry}}}{{/retry}}
  {{#role_assignments}}role_assignments                      = {{{role_assignments}}}{{/role_assignments}}
  {{#sampling_percentage}}sampling_percentage                   = {{{sampling_percentage}}}{{/sampling_percentage}}
  {{#tags}}tags                                  = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                              = {{{timeouts}}}{{/timeouts}}
}
