terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_devopsinfrastructure_pool" {
  source  = "Azure/avm-res-devopsinfrastructure-pool/azurerm"
  version = "0.3.1"

  {{#if dev_center_project_resource_id}}dev_center_project_resource_id                      = {{hclVal dev_center_project_resource_id}}{{/if}}
  {{#if location}}location                                            = {{hclVal location}}{{/if}}
  {{#if name}}name                                                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                                 = {{hclVal resource_group_name}}{{/if}}
  {{#if agent_profile_grace_period_time_span}}agent_profile_grace_period_time_span                = {{hclVal agent_profile_grace_period_time_span}}{{/if}}
  {{#if agent_profile_kind}}agent_profile_kind                                  = {{hclVal agent_profile_kind}}{{/if}}
  {{#if agent_profile_max_agent_lifetime}}agent_profile_max_agent_lifetime                    = {{hclVal agent_profile_max_agent_lifetime}}{{/if}}
  {{#if agent_profile_resource_prediction_profile}}agent_profile_resource_prediction_profile           = {{hclVal agent_profile_resource_prediction_profile}}{{/if}}
  {{#if agent_profile_resource_prediction_profile_automatic}}agent_profile_resource_prediction_profile_automatic = {{hclVal agent_profile_resource_prediction_profile_automatic}}{{/if}}
  {{#if agent_profile_resource_prediction_profile_manual}}agent_profile_resource_prediction_profile_manual    = {{hclVal agent_profile_resource_prediction_profile_manual}}{{/if}}
  {{#if agent_profile_resource_predictions_manual}}agent_profile_resource_predictions_manual           = {{hclVal agent_profile_resource_predictions_manual}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                                 = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                    = {{hclVal enable_telemetry}}{{/if}}
  {{#if fabric_profile_data_disks}}fabric_profile_data_disks                           = {{hclVal fabric_profile_data_disks}}{{/if}}
  {{#if fabric_profile_images}}fabric_profile_images                               = {{hclVal fabric_profile_images}}{{/if}}
  {{#if fabric_profile_os_disk_storage_account_type}}fabric_profile_os_disk_storage_account_type         = {{hclVal fabric_profile_os_disk_storage_account_type}}{{/if}}
  {{#if fabric_profile_os_profile_logon_type}}fabric_profile_os_profile_logon_type                = {{hclVal fabric_profile_os_profile_logon_type}}{{/if}}
  {{#if fabric_profile_sku_name}}fabric_profile_sku_name                             = {{hclVal fabric_profile_sku_name}}{{/if}}
  {{#if lock}}lock                                                = {{hclVal lock}}{{/if}}
  {{#if managed_devops_pool_retry_on_error}}managed_devops_pool_retry_on_error                  = {{hclVal managed_devops_pool_retry_on_error}}{{/if}}
  {{#if managed_devops_pool_timeouts}}managed_devops_pool_timeouts                        = {{hclVal managed_devops_pool_timeouts}}{{/if}}
  {{#if managed_identities}}managed_identities                                  = {{hclVal managed_identities}}{{/if}}
  {{#if maximum_concurrency}}maximum_concurrency                                 = {{hclVal maximum_concurrency}}{{/if}}
  {{#if organization_profile}}organization_profile                                = {{hclVal organization_profile}}{{/if}}
  {{#if role_assignments}}role_assignments                                    = {{hclVal role_assignments}}{{/if}}
  {{#if subnet_id}}subnet_id                                           = {{hclVal subnet_id}}{{/if}}
  {{#if subscription_id}}subscription_id                                     = {{hclVal subscription_id}}{{/if}}
  {{#if tags}}tags                                                = {{hclVal tags}}{{/if}}
  {{#if version_control_system_organization_name}}version_control_system_organization_name            = {{hclVal version_control_system_organization_name}}{{/if}}
  {{#if version_control_system_project_names}}version_control_system_project_names                = {{hclVal version_control_system_project_names}}{{/if}}
  {{#if version_control_system_type}}version_control_system_type                         = {{hclVal version_control_system_type}}{{/if}}
}
