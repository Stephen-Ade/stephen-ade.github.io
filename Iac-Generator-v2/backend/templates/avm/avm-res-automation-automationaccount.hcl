terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-automation-automationaccount" {
  source  = "Azure/avm-res-automation-automationaccount/azurerm"
  version = "0.2.0"

  {{#if location}}location                                   = {{hclVal location}}{{/if}}
  {{#if name}}name                                       = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                        = {{hclVal resource_group_name}}{{/if}}
  {{#if sku}}sku                                        = {{hclVal sku}}{{/if}}
  {{#if automation_certificates}}automation_certificates                    = {{hclVal automation_certificates}}{{/if}}
  {{#if automation_connection_certificates}}automation_connection_certificates         = {{hclVal automation_connection_certificates}}{{/if}}
  {{#if automation_connection_classic_certificates}}automation_connection_classic_certificates = {{hclVal automation_connection_classic_certificates}}{{/if}}
  {{#if automation_connection_service_principals}}automation_connection_service_principals   = {{hclVal automation_connection_service_principals}}{{/if}}
  {{#if automation_connections}}automation_connections                     = {{hclVal automation_connections}}{{/if}}
  {{#if automation_credentials}}automation_credentials                     = {{hclVal automation_credentials}}{{/if}}
  {{#if automation_hybrid_runbook_worker_groups}}automation_hybrid_runbook_worker_groups    = {{hclVal automation_hybrid_runbook_worker_groups}}{{/if}}
  {{#if automation_hybrid_runbook_workers}}automation_hybrid_runbook_workers          = {{hclVal automation_hybrid_runbook_workers}}{{/if}}
  {{#if automation_job_schedules}}automation_job_schedules                   = {{hclVal automation_job_schedules}}{{/if}}
  {{#if automation_modules}}automation_modules                         = {{hclVal automation_modules}}{{/if}}
  {{#if automation_powershell72_modules}}automation_powershell72_modules            = {{hclVal automation_powershell72_modules}}{{/if}}
  {{#if automation_python3_packages}}automation_python3_packages                = {{hclVal automation_python3_packages}}{{/if}}
  {{#if automation_runbooks}}automation_runbooks                        = {{hclVal automation_runbooks}}{{/if}}
  {{#if automation_schedules}}automation_schedules                       = {{hclVal automation_schedules}}{{/if}}
  {{#if automation_source_controls}}automation_source_controls                 = {{hclVal automation_source_controls}}{{/if}}
  {{#if automation_variable_bools}}automation_variable_bools                  = {{hclVal automation_variable_bools}}{{/if}}
  {{#if automation_variable_datetimes}}automation_variable_datetimes              = {{hclVal automation_variable_datetimes}}{{/if}}
  {{#if automation_variable_ints}}automation_variable_ints                   = {{hclVal automation_variable_ints}}{{/if}}
  {{#if automation_variable_objects}}automation_variable_objects                = {{hclVal automation_variable_objects}}{{/if}}
  {{#if automation_variable_strings}}automation_variable_strings                = {{hclVal automation_variable_strings}}{{/if}}
  {{#if automation_watchers}}automation_watchers                        = {{hclVal automation_watchers}}{{/if}}
  {{#if automation_webhooks}}automation_webhooks                        = {{hclVal automation_webhooks}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                        = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                           = {{hclVal enable_telemetry}}{{/if}}
  {{#if encryption}}encryption                                 = {{hclVal encryption}}{{/if}}
  {{#if local_authentication_enabled}}local_authentication_enabled               = {{hclVal local_authentication_enabled}}{{/if}}
  {{#if lock}}lock                                       = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                         = {{hclVal managed_identities}}{{/if}}
  {{#if private_endpoints}}private_endpoints                          = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group    = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled              = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                           = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                       = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                   = {{hclVal timeouts}}{{/if}}
}
