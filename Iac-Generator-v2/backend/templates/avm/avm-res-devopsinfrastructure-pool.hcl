terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-devopsinfrastructure-pool" {
  source  = "Azure/avm-res-devopsinfrastructure-pool/azurerm"
  version = "0.3.1"

  {{#dev_center_project_resource_id}}dev_center_project_resource_id                      = {{{dev_center_project_resource_id}}}{{/dev_center_project_resource_id}}
  {{#location}}location                                            = {{{location}}}{{/location}}
  {{#name}}name                                                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                                 = {{{resource_group_name}}}{{/resource_group_name}}
  {{#agent_profile_grace_period_time_span}}agent_profile_grace_period_time_span                = {{{agent_profile_grace_period_time_span}}}{{/agent_profile_grace_period_time_span}}
  {{#agent_profile_kind}}agent_profile_kind                                  = {{{agent_profile_kind}}}{{/agent_profile_kind}}
  {{#agent_profile_max_agent_lifetime}}agent_profile_max_agent_lifetime                    = {{{agent_profile_max_agent_lifetime}}}{{/agent_profile_max_agent_lifetime}}
  {{#agent_profile_resource_prediction_profile}}agent_profile_resource_prediction_profile           = {{{agent_profile_resource_prediction_profile}}}{{/agent_profile_resource_prediction_profile}}
  {{#agent_profile_resource_prediction_profile_automatic}}agent_profile_resource_prediction_profile_automatic = {{{agent_profile_resource_prediction_profile_automatic}}}{{/agent_profile_resource_prediction_profile_automatic}}
  {{#agent_profile_resource_prediction_profile_manual}}agent_profile_resource_prediction_profile_manual    = {{{agent_profile_resource_prediction_profile_manual}}}{{/agent_profile_resource_prediction_profile_manual}}
  {{#agent_profile_resource_predictions_manual}}agent_profile_resource_predictions_manual           = {{{agent_profile_resource_predictions_manual}}}{{/agent_profile_resource_predictions_manual}}
  {{#diagnostic_settings}}diagnostic_settings                                 = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                                    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#fabric_profile_data_disks}}fabric_profile_data_disks                           = {{{fabric_profile_data_disks}}}{{/fabric_profile_data_disks}}
  {{#fabric_profile_images}}fabric_profile_images                               = {{{fabric_profile_images}}}{{/fabric_profile_images}}
  {{#fabric_profile_os_disk_storage_account_type}}fabric_profile_os_disk_storage_account_type         = {{{fabric_profile_os_disk_storage_account_type}}}{{/fabric_profile_os_disk_storage_account_type}}
  {{#fabric_profile_os_profile_logon_type}}fabric_profile_os_profile_logon_type                = {{{fabric_profile_os_profile_logon_type}}}{{/fabric_profile_os_profile_logon_type}}
  {{#fabric_profile_sku_name}}fabric_profile_sku_name                             = {{{fabric_profile_sku_name}}}{{/fabric_profile_sku_name}}
  {{#lock}}lock                                                = {{{lock}}}{{/lock}}
  {{#managed_devops_pool_retry_on_error}}managed_devops_pool_retry_on_error                  = {{{managed_devops_pool_retry_on_error}}}{{/managed_devops_pool_retry_on_error}}
  {{#managed_devops_pool_timeouts}}managed_devops_pool_timeouts                        = {{{managed_devops_pool_timeouts}}}{{/managed_devops_pool_timeouts}}
  {{#managed_identities}}managed_identities                                  = {{{managed_identities}}}{{/managed_identities}}
  {{#maximum_concurrency}}maximum_concurrency                                 = {{{maximum_concurrency}}}{{/maximum_concurrency}}
  {{#organization_profile}}organization_profile                                = {{{organization_profile}}}{{/organization_profile}}
  {{#role_assignments}}role_assignments                                    = {{{role_assignments}}}{{/role_assignments}}
  {{#subnet_id}}subnet_id                                           = {{{subnet_id}}}{{/subnet_id}}
  {{#subscription_id}}subscription_id                                     = {{{subscription_id}}}{{/subscription_id}}
  {{#tags}}tags                                                = {{{tags}}}{{/tags}}
  {{#version_control_system_organization_name}}version_control_system_organization_name            = {{{version_control_system_organization_name}}}{{/version_control_system_organization_name}}
  {{#version_control_system_project_names}}version_control_system_project_names                = {{{version_control_system_project_names}}}{{/version_control_system_project_names}}
  {{#version_control_system_type}}version_control_system_type                         = {{{version_control_system_type}}}{{/version_control_system_type}}
}
