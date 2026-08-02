terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-recoveryservices-vault" {
  source  = "Azure/avm-res-recoveryservices-vault/azurerm"
  version = "1.2.0"

  {{#location}}location                                       = {{{location}}}{{/location}}
  {{#name}}name                                           = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                            = {{{resource_group_name}}}{{/resource_group_name}}
  {{#sku}}sku                                            = {{{sku}}}{{/sku}}
  {{#alerts_for_all_job_failures_enabled}}alerts_for_all_job_failures_enabled            = {{{alerts_for_all_job_failures_enabled}}}{{/alerts_for_all_job_failures_enabled}}
  {{#alerts_for_critical_operation_failures_enabled}}alerts_for_critical_operation_failures_enabled = {{{alerts_for_critical_operation_failures_enabled}}}{{/alerts_for_critical_operation_failures_enabled}}
  {{#backup_protected_file_share}}backup_protected_file_share                    = {{{backup_protected_file_share}}}{{/backup_protected_file_share}}
  {{#backup_protected_vm}}backup_protected_vm                            = {{{backup_protected_vm}}}{{/backup_protected_vm}}
  {{#classic_vmware_replication_enabled}}classic_vmware_replication_enabled             = {{{classic_vmware_replication_enabled}}}{{/classic_vmware_replication_enabled}}
  {{#cross_region_restore_enabled}}cross_region_restore_enabled                   = {{{cross_region_restore_enabled}}}{{/cross_region_restore_enabled}}
  {{#diagnostic_settings}}diagnostic_settings                            = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                               = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#file_share_backup_policy}}file_share_backup_policy                       = {{{file_share_backup_policy}}}{{/file_share_backup_policy}}
  {{#immutability}}immutability                                   = {{{immutability}}}{{/immutability}}
  {{#lock}}lock                                           = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                             = {{{managed_identities}}}{{/managed_identities}}
  {{#private_endpoints}}private_endpoints                              = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group        = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled                  = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#resource_guard_id}}resource_guard_id                              = {{{resource_guard_id}}}{{/resource_guard_id}}
  {{#resource_guard_operation_requests}}resource_guard_operation_requests              = {{{resource_guard_operation_requests}}}{{/resource_guard_operation_requests}}
  {{#role_assignments}}role_assignments                               = {{{role_assignments}}}{{/role_assignments}}
  {{#site_recovery_replicated_vm}}site_recovery_replicated_vm                    = {{{site_recovery_replicated_vm}}}{{/site_recovery_replicated_vm}}
  {{#soft_delete_enabled}}soft_delete_enabled                            = {{{soft_delete_enabled}}}{{/soft_delete_enabled}}
  {{#storage_mode_type}}storage_mode_type                              = {{{storage_mode_type}}}{{/storage_mode_type}}
  {{#tags}}tags                                           = {{{tags}}}{{/tags}}
  {{#vm_backup_policy}}vm_backup_policy                               = {{{vm_backup_policy}}}{{/vm_backup_policy}}
  {{#workload_backup_policy}}workload_backup_policy                         = {{{workload_backup_policy}}}{{/workload_backup_policy}}
}
