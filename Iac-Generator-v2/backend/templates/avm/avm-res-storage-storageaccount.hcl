terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-storage-storageaccount" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "0.7.3"

  {{#if location}}location                                  = {{hclVal location}}{{/if}}
  {{#if name}}name                                      = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                                 = {{hclVal parent_id}}{{/if}}
  {{#if access_tier}}access_tier                               = {{hclVal access_tier}}{{/if}}
  {{#if account_kind}}account_kind                              = {{hclVal account_kind}}{{/if}}
  {{#if account_replication_type}}account_replication_type                  = {{hclVal account_replication_type}}{{/if}}
  {{#if account_sku_name}}account_sku_name                          = {{hclVal account_sku_name}}{{/if}}
  {{#if account_tier}}account_tier                              = {{hclVal account_tier}}{{/if}}
  {{#if allow_nested_items_to_be_public}}allow_nested_items_to_be_public           = {{hclVal allow_nested_items_to_be_public}}{{/if}}
  {{#if allowed_copy_scope}}allowed_copy_scope                        = {{hclVal allowed_copy_scope}}{{/if}}
  {{#if azure_files_authentication}}azure_files_authentication                = {{hclVal azure_files_authentication}}{{/if}}
  {{#if blob_properties}}blob_properties                           = {{hclVal blob_properties}}{{/if}}
  {{#if containers}}containers                                = {{hclVal containers}}{{/if}}
  {{#if cross_tenant_replication_enabled}}cross_tenant_replication_enabled          = {{hclVal cross_tenant_replication_enabled}}{{/if}}
  {{#if custom_domain}}custom_domain                             = {{hclVal custom_domain}}{{/if}}
  {{#if default_to_oauth_authentication}}default_to_oauth_authentication           = {{hclVal default_to_oauth_authentication}}{{/if}}
  {{#if diagnostic_settings_blob}}diagnostic_settings_blob                  = {{hclVal diagnostic_settings_blob}}{{/if}}
  {{#if diagnostic_settings_file}}diagnostic_settings_file                  = {{hclVal diagnostic_settings_file}}{{/if}}
  {{#if diagnostic_settings_queue}}diagnostic_settings_queue                 = {{hclVal diagnostic_settings_queue}}{{/if}}
  {{#if diagnostic_settings_storage_account}}diagnostic_settings_storage_account       = {{hclVal diagnostic_settings_storage_account}}{{/if}}
  {{#if diagnostic_settings_table}}diagnostic_settings_table                 = {{hclVal diagnostic_settings_table}}{{/if}}
  {{#if edge_zone}}edge_zone                                 = {{hclVal edge_zone}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                          = {{hclVal enable_telemetry}}{{/if}}
  {{#if file_service_properties}}file_service_properties                   = {{hclVal file_service_properties}}{{/if}}
  {{#if https_traffic_only_enabled}}https_traffic_only_enabled                = {{hclVal https_traffic_only_enabled}}{{/if}}
  {{#if immutability_policy}}immutability_policy                       = {{hclVal immutability_policy}}{{/if}}
  {{#if infrastructure_encryption_enabled}}infrastructure_encryption_enabled         = {{hclVal infrastructure_encryption_enabled}}{{/if}}
  {{#if is_hns_enabled}}is_hns_enabled                            = {{hclVal is_hns_enabled}}{{/if}}
  {{#if large_file_share_enabled}}large_file_share_enabled                  = {{hclVal large_file_share_enabled}}{{/if}}
  {{#if local_user}}local_user                                = {{hclVal local_user}}{{/if}}
  {{#if local_user_enabled}}local_user_enabled                        = {{hclVal local_user_enabled}}{{/if}}
  {{#if lock}}lock                                      = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                        = {{hclVal managed_identities}}{{/if}}
  {{#if min_tls_version}}min_tls_version                           = {{hclVal min_tls_version}}{{/if}}
  {{#if network_rules}}network_rules                             = {{hclVal network_rules}}{{/if}}
  {{#if nfsv3_enabled}}nfsv3_enabled                             = {{hclVal nfsv3_enabled}}{{/if}}
  {{#if private_endpoints}}private_endpoints                         = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group   = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if provisioned_billing_model_version}}provisioned_billing_model_version         = {{hclVal provisioned_billing_model_version}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled             = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if queue_encryption_key_type}}queue_encryption_key_type                 = {{hclVal queue_encryption_key_type}}{{/if}}
  {{#if queue_properties}}queue_properties                          = {{hclVal queue_properties}}{{/if}}
  {{#if queues}}queues                                    = {{hclVal queues}}{{/if}}
  {{#if resource_types}}resource_types                            = {{hclVal resource_types}}{{/if}}
  {{#if retry}}retry                                     = {{hclVal retry}}{{/if}}
  {{#if role_assignment_definition_lookup_enabled}}role_assignment_definition_lookup_enabled = {{hclVal role_assignment_definition_lookup_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                          = {{hclVal role_assignments}}{{/if}}
  {{#if routing}}routing                                   = {{hclVal routing}}{{/if}}
  {{#if sas_policy}}sas_policy                                = {{hclVal sas_policy}}{{/if}}
  {{#if sftp_enabled}}sftp_enabled                              = {{hclVal sftp_enabled}}{{/if}}
  {{#if shared_access_key_enabled}}shared_access_key_enabled                 = {{hclVal shared_access_key_enabled}}{{/if}}
  {{#if shares}}shares                                    = {{hclVal shares}}{{/if}}
  {{#if static_website}}static_website                            = {{hclVal static_website}}{{/if}}
  {{#if storage_data_lake_gen2_filesystems}}storage_data_lake_gen2_filesystems        = {{hclVal storage_data_lake_gen2_filesystems}}{{/if}}
  {{#if storage_management_policy_rule}}storage_management_policy_rule            = {{hclVal storage_management_policy_rule}}{{/if}}
  {{#if storage_management_policy_timeouts}}storage_management_policy_timeouts        = {{hclVal storage_management_policy_timeouts}}{{/if}}
  {{#if table_encryption_key_type}}table_encryption_key_type                 = {{hclVal table_encryption_key_type}}{{/if}}
  {{#if table_properties}}table_properties                          = {{hclVal table_properties}}{{/if}}
  {{#if table_service_cors_propagation_wait}}table_service_cors_propagation_wait       = {{hclVal table_service_cors_propagation_wait}}{{/if}}
  {{#if tables}}tables                                    = {{hclVal tables}}{{/if}}
  {{#if tags}}tags                                      = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                  = {{hclVal timeouts}}{{/if}}
}
