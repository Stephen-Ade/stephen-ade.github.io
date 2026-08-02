terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-dataprotection-backupvault" {
  source  = "Azure/avm-res-dataprotection-backupvault/azurerm"
  version = "2.0.8"

  {{#if datastore_type}}datastore_type                              = {{hclVal datastore_type}}{{/if}}
  {{#if location}}location                                    = {{hclVal location}}{{/if}}
  {{#if name}}name                                        = {{hclVal name}}{{/if}}
  {{#if redundancy}}redundancy                                  = {{hclVal redundancy}}{{/if}}
  {{#if resource_group_name}}resource_group_name                         = {{hclVal resource_group_name}}{{/if}}
  {{#if alerts_for_all_job_failures}}alerts_for_all_job_failures                 = {{hclVal alerts_for_all_job_failures}}{{/if}}
  {{#if backup_instances}}backup_instances                            = {{hclVal backup_instances}}{{/if}}
  {{#if backup_policies}}backup_policies                             = {{hclVal backup_policies}}{{/if}}
  {{#if backup_vault_resource_type}}backup_vault_resource_type                  = {{hclVal backup_vault_resource_type}}{{/if}}
  {{#if cross_region_restore_enabled}}cross_region_restore_enabled                = {{hclVal cross_region_restore_enabled}}{{/if}}
  {{#if cross_subscription_restore_state}}cross_subscription_restore_state            = {{hclVal cross_subscription_restore_state}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                         = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                            = {{hclVal enable_telemetry}}{{/if}}
  {{#if immutability}}immutability                                = {{hclVal immutability}}{{/if}}
  {{#if lock}}lock                                        = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                          = {{hclVal managed_identities}}{{/if}}
  {{#if permanent_delete_on_destroy}}permanent_delete_on_destroy                 = {{hclVal permanent_delete_on_destroy}}{{/if}}
  {{#if replicated_regions}}replicated_regions                          = {{hclVal replicated_regions}}{{/if}}
  {{#if resource_guard_enabled}}resource_guard_enabled                      = {{hclVal resource_guard_enabled}}{{/if}}
  {{#if resource_guard_name}}resource_guard_name                         = {{hclVal resource_guard_name}}{{/if}}
  {{#if resource_guard_resource_id}}resource_guard_resource_id                  = {{hclVal resource_guard_resource_id}}{{/if}}
  {{#if retention_duration_in_days}}retention_duration_in_days                  = {{hclVal retention_duration_in_days}}{{/if}}
  {{#if role_assignments}}role_assignments                            = {{hclVal role_assignments}}{{/if}}
  {{#if soft_delete}}soft_delete                                 = {{hclVal soft_delete}}{{/if}}
  {{#if tags}}tags                                        = {{hclVal tags}}{{/if}}
  {{#if timeout_create}}timeout_create                              = {{hclVal timeout_create}}{{/if}}
  {{#if timeout_delete}}timeout_delete                              = {{hclVal timeout_delete}}{{/if}}
  {{#if timeout_read}}timeout_read                                = {{hclVal timeout_read}}{{/if}}
  {{#if timeout_update}}timeout_update                              = {{hclVal timeout_update}}{{/if}}
  {{#if vault_critical_operation_exclusion_list}}vault_critical_operation_exclusion_list     = {{hclVal vault_critical_operation_exclusion_list}}{{/if}}
  {{#if wait_for_backup_instance_configure_duration}}wait_for_backup_instance_configure_duration = {{hclVal wait_for_backup_instance_configure_duration}}{{/if}}
}
