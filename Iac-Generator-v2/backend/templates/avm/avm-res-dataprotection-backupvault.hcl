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

  {{#datastore_type}}datastore_type                              = {{{datastore_type}}}{{/datastore_type}}
  {{#location}}location                                    = {{{location}}}{{/location}}
  {{#name}}name                                        = {{{name}}}{{/name}}
  {{#redundancy}}redundancy                                  = {{{redundancy}}}{{/redundancy}}
  {{#resource_group_name}}resource_group_name                         = {{{resource_group_name}}}{{/resource_group_name}}
  {{#alerts_for_all_job_failures}}alerts_for_all_job_failures                 = {{{alerts_for_all_job_failures}}}{{/alerts_for_all_job_failures}}
  {{#backup_instances}}backup_instances                            = {{{backup_instances}}}{{/backup_instances}}
  {{#backup_policies}}backup_policies                             = {{{backup_policies}}}{{/backup_policies}}
  {{#backup_vault_resource_type}}backup_vault_resource_type                  = {{{backup_vault_resource_type}}}{{/backup_vault_resource_type}}
  {{#cross_region_restore_enabled}}cross_region_restore_enabled                = {{{cross_region_restore_enabled}}}{{/cross_region_restore_enabled}}
  {{#cross_subscription_restore_state}}cross_subscription_restore_state            = {{{cross_subscription_restore_state}}}{{/cross_subscription_restore_state}}
  {{#diagnostic_settings}}diagnostic_settings                         = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                            = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#immutability}}immutability                                = {{{immutability}}}{{/immutability}}
  {{#lock}}lock                                        = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                          = {{{managed_identities}}}{{/managed_identities}}
  {{#permanent_delete_on_destroy}}permanent_delete_on_destroy                 = {{{permanent_delete_on_destroy}}}{{/permanent_delete_on_destroy}}
  {{#replicated_regions}}replicated_regions                          = {{{replicated_regions}}}{{/replicated_regions}}
  {{#resource_guard_enabled}}resource_guard_enabled                      = {{{resource_guard_enabled}}}{{/resource_guard_enabled}}
  {{#resource_guard_name}}resource_guard_name                         = {{{resource_guard_name}}}{{/resource_guard_name}}
  {{#resource_guard_resource_id}}resource_guard_resource_id                  = {{{resource_guard_resource_id}}}{{/resource_guard_resource_id}}
  {{#retention_duration_in_days}}retention_duration_in_days                  = {{{retention_duration_in_days}}}{{/retention_duration_in_days}}
  {{#role_assignments}}role_assignments                            = {{{role_assignments}}}{{/role_assignments}}
  {{#soft_delete}}soft_delete                                 = {{{soft_delete}}}{{/soft_delete}}
  {{#tags}}tags                                        = {{{tags}}}{{/tags}}
  {{#timeout_create}}timeout_create                              = {{{timeout_create}}}{{/timeout_create}}
  {{#timeout_delete}}timeout_delete                              = {{{timeout_delete}}}{{/timeout_delete}}
  {{#timeout_read}}timeout_read                                = {{{timeout_read}}}{{/timeout_read}}
  {{#timeout_update}}timeout_update                              = {{{timeout_update}}}{{/timeout_update}}
  {{#vault_critical_operation_exclusion_list}}vault_critical_operation_exclusion_list     = {{{vault_critical_operation_exclusion_list}}}{{/vault_critical_operation_exclusion_list}}
  {{#wait_for_backup_instance_configure_duration}}wait_for_backup_instance_configure_duration = {{{wait_for_backup_instance_configure_duration}}}{{/wait_for_backup_instance_configure_duration}}
}
