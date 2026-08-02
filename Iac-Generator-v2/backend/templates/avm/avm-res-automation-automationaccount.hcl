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

  {{#location}}location                                   = {{{location}}}{{/location}}
  {{#name}}name                                       = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                        = {{{resource_group_name}}}{{/resource_group_name}}
  {{#sku}}sku                                        = {{{sku}}}{{/sku}}
  {{#automation_certificates}}automation_certificates                    = {{{automation_certificates}}}{{/automation_certificates}}
  {{#automation_connection_certificates}}automation_connection_certificates         = {{{automation_connection_certificates}}}{{/automation_connection_certificates}}
  {{#automation_connection_classic_certificates}}automation_connection_classic_certificates = {{{automation_connection_classic_certificates}}}{{/automation_connection_classic_certificates}}
  {{#automation_connection_service_principals}}automation_connection_service_principals   = {{{automation_connection_service_principals}}}{{/automation_connection_service_principals}}
  {{#automation_connections}}automation_connections                     = {{{automation_connections}}}{{/automation_connections}}
  {{#automation_credentials}}automation_credentials                     = {{{automation_credentials}}}{{/automation_credentials}}
  {{#automation_hybrid_runbook_worker_groups}}automation_hybrid_runbook_worker_groups    = {{{automation_hybrid_runbook_worker_groups}}}{{/automation_hybrid_runbook_worker_groups}}
  {{#automation_hybrid_runbook_workers}}automation_hybrid_runbook_workers          = {{{automation_hybrid_runbook_workers}}}{{/automation_hybrid_runbook_workers}}
  {{#automation_job_schedules}}automation_job_schedules                   = {{{automation_job_schedules}}}{{/automation_job_schedules}}
  {{#automation_modules}}automation_modules                         = {{{automation_modules}}}{{/automation_modules}}
  {{#automation_powershell72_modules}}automation_powershell72_modules            = {{{automation_powershell72_modules}}}{{/automation_powershell72_modules}}
  {{#automation_python3_packages}}automation_python3_packages                = {{{automation_python3_packages}}}{{/automation_python3_packages}}
  {{#automation_runbooks}}automation_runbooks                        = {{{automation_runbooks}}}{{/automation_runbooks}}
  {{#automation_schedules}}automation_schedules                       = {{{automation_schedules}}}{{/automation_schedules}}
  {{#automation_source_controls}}automation_source_controls                 = {{{automation_source_controls}}}{{/automation_source_controls}}
  {{#automation_variable_bools}}automation_variable_bools                  = {{{automation_variable_bools}}}{{/automation_variable_bools}}
  {{#automation_variable_datetimes}}automation_variable_datetimes              = {{{automation_variable_datetimes}}}{{/automation_variable_datetimes}}
  {{#automation_variable_ints}}automation_variable_ints                   = {{{automation_variable_ints}}}{{/automation_variable_ints}}
  {{#automation_variable_objects}}automation_variable_objects                = {{{automation_variable_objects}}}{{/automation_variable_objects}}
  {{#automation_variable_strings}}automation_variable_strings                = {{{automation_variable_strings}}}{{/automation_variable_strings}}
  {{#automation_watchers}}automation_watchers                        = {{{automation_watchers}}}{{/automation_watchers}}
  {{#automation_webhooks}}automation_webhooks                        = {{{automation_webhooks}}}{{/automation_webhooks}}
  {{#diagnostic_settings}}diagnostic_settings                        = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                           = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#encryption}}encryption                                 = {{{encryption}}}{{/encryption}}
  {{#local_authentication_enabled}}local_authentication_enabled               = {{{local_authentication_enabled}}}{{/local_authentication_enabled}}
  {{#lock}}lock                                       = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                         = {{{managed_identities}}}{{/managed_identities}}
  {{#private_endpoints}}private_endpoints                          = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group    = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled              = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                           = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                       = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                   = {{{timeouts}}}{{/timeouts}}
}
