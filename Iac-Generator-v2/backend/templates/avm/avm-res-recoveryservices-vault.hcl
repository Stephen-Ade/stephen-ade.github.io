terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_recoveryservices_vault" {
  source  = "Azure/avm-res-recoveryservices-vault/azurerm"
  version = "1.2.0"

  {{#if location}}location                                       = {{hclVal location}}{{/if}}
  {{#if name}}name                                           = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                            = {{hclVal resource_group_name}}{{/if}}
  {{#if sku}}sku                                            = {{hclVal sku}}{{/if}}
  {{#if alerts_for_all_job_failures_enabled}}alerts_for_all_job_failures_enabled            = {{hclVal alerts_for_all_job_failures_enabled}}{{/if}}
  {{#if alerts_for_critical_operation_failures_enabled}}alerts_for_critical_operation_failures_enabled = {{hclVal alerts_for_critical_operation_failures_enabled}}{{/if}}
  {{#if backup_protected_file_share}}backup_protected_file_share                    = {{hclVal backup_protected_file_share}}{{/if}}
  {{#if backup_protected_vm}}backup_protected_vm                            = {{hclVal backup_protected_vm}}{{/if}}
  {{#if classic_vmware_replication_enabled}}classic_vmware_replication_enabled             = {{hclVal classic_vmware_replication_enabled}}{{/if}}
  {{#if cross_region_restore_enabled}}cross_region_restore_enabled                   = {{hclVal cross_region_restore_enabled}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                            = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                               = {{hclVal enable_telemetry}}{{/if}}
  {{#if file_share_backup_policy}}file_share_backup_policy                       = {{hclVal file_share_backup_policy}}{{/if}}
  {{#if immutability}}immutability                                   = {{hclVal immutability}}{{/if}}
  {{#if lock}}lock                                           = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                             = {{hclVal managed_identities}}{{/if}}
  {{#if private_endpoints}}private_endpoints                              = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group        = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled                  = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if resource_guard_id}}resource_guard_id                              = {{hclVal resource_guard_id}}{{/if}}
  {{#if resource_guard_operation_requests}}resource_guard_operation_requests              = {{hclVal resource_guard_operation_requests}}{{/if}}
  {{#if role_assignments}}role_assignments                               = {{hclVal role_assignments}}{{/if}}
  {{#if site_recovery_replicated_vm}}site_recovery_replicated_vm                    = {{hclVal site_recovery_replicated_vm}}{{/if}}
  {{#if soft_delete_enabled}}soft_delete_enabled                            = {{hclVal soft_delete_enabled}}{{/if}}
  {{#if storage_mode_type}}storage_mode_type                              = {{hclVal storage_mode_type}}{{/if}}
  {{#if tags}}tags                                           = {{hclVal tags}}{{/if}}
  {{#if vm_backup_policy}}vm_backup_policy                               = {{hclVal vm_backup_policy}}{{/if}}
  {{#if workload_backup_policy}}workload_backup_policy                         = {{hclVal workload_backup_policy}}{{/if}}
}
