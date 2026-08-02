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

  {{#location}}location                                  = {{{location}}}{{/location}}
  {{#name}}name                                      = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                                 = {{{parent_id}}}{{/parent_id}}
  {{#access_tier}}access_tier                               = {{{access_tier}}}{{/access_tier}}
  {{#account_kind}}account_kind                              = {{{account_kind}}}{{/account_kind}}
  {{#account_replication_type}}account_replication_type                  = {{{account_replication_type}}}{{/account_replication_type}}
  {{#account_sku_name}}account_sku_name                          = {{{account_sku_name}}}{{/account_sku_name}}
  {{#account_tier}}account_tier                              = {{{account_tier}}}{{/account_tier}}
  {{#allow_nested_items_to_be_public}}allow_nested_items_to_be_public           = {{{allow_nested_items_to_be_public}}}{{/allow_nested_items_to_be_public}}
  {{#allowed_copy_scope}}allowed_copy_scope                        = {{{allowed_copy_scope}}}{{/allowed_copy_scope}}
  {{#azure_files_authentication}}azure_files_authentication                = {{{azure_files_authentication}}}{{/azure_files_authentication}}
  {{#blob_properties}}blob_properties                           = {{{blob_properties}}}{{/blob_properties}}
  {{#containers}}containers                                = {{{containers}}}{{/containers}}
  {{#cross_tenant_replication_enabled}}cross_tenant_replication_enabled          = {{{cross_tenant_replication_enabled}}}{{/cross_tenant_replication_enabled}}
  {{#custom_domain}}custom_domain                             = {{{custom_domain}}}{{/custom_domain}}
  {{#default_to_oauth_authentication}}default_to_oauth_authentication           = {{{default_to_oauth_authentication}}}{{/default_to_oauth_authentication}}
  {{#diagnostic_settings_blob}}diagnostic_settings_blob                  = {{{diagnostic_settings_blob}}}{{/diagnostic_settings_blob}}
  {{#diagnostic_settings_file}}diagnostic_settings_file                  = {{{diagnostic_settings_file}}}{{/diagnostic_settings_file}}
  {{#diagnostic_settings_queue}}diagnostic_settings_queue                 = {{{diagnostic_settings_queue}}}{{/diagnostic_settings_queue}}
  {{#diagnostic_settings_storage_account}}diagnostic_settings_storage_account       = {{{diagnostic_settings_storage_account}}}{{/diagnostic_settings_storage_account}}
  {{#diagnostic_settings_table}}diagnostic_settings_table                 = {{{diagnostic_settings_table}}}{{/diagnostic_settings_table}}
  {{#edge_zone}}edge_zone                                 = {{{edge_zone}}}{{/edge_zone}}
  {{#enable_telemetry}}enable_telemetry                          = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#file_service_properties}}file_service_properties                   = {{{file_service_properties}}}{{/file_service_properties}}
  {{#https_traffic_only_enabled}}https_traffic_only_enabled                = {{{https_traffic_only_enabled}}}{{/https_traffic_only_enabled}}
  {{#immutability_policy}}immutability_policy                       = {{{immutability_policy}}}{{/immutability_policy}}
  {{#infrastructure_encryption_enabled}}infrastructure_encryption_enabled         = {{{infrastructure_encryption_enabled}}}{{/infrastructure_encryption_enabled}}
  {{#is_hns_enabled}}is_hns_enabled                            = {{{is_hns_enabled}}}{{/is_hns_enabled}}
  {{#large_file_share_enabled}}large_file_share_enabled                  = {{{large_file_share_enabled}}}{{/large_file_share_enabled}}
  {{#local_user}}local_user                                = {{{local_user}}}{{/local_user}}
  {{#local_user_enabled}}local_user_enabled                        = {{{local_user_enabled}}}{{/local_user_enabled}}
  {{#lock}}lock                                      = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                        = {{{managed_identities}}}{{/managed_identities}}
  {{#min_tls_version}}min_tls_version                           = {{{min_tls_version}}}{{/min_tls_version}}
  {{#network_rules}}network_rules                             = {{{network_rules}}}{{/network_rules}}
  {{#nfsv3_enabled}}nfsv3_enabled                             = {{{nfsv3_enabled}}}{{/nfsv3_enabled}}
  {{#private_endpoints}}private_endpoints                         = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group   = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#provisioned_billing_model_version}}provisioned_billing_model_version         = {{{provisioned_billing_model_version}}}{{/provisioned_billing_model_version}}
  {{#public_network_access_enabled}}public_network_access_enabled             = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#queue_encryption_key_type}}queue_encryption_key_type                 = {{{queue_encryption_key_type}}}{{/queue_encryption_key_type}}
  {{#queue_properties}}queue_properties                          = {{{queue_properties}}}{{/queue_properties}}
  {{#queues}}queues                                    = {{{queues}}}{{/queues}}
  {{#resource_types}}resource_types                            = {{{resource_types}}}{{/resource_types}}
  {{#retry}}retry                                     = {{{retry}}}{{/retry}}
  {{#role_assignment_definition_lookup_enabled}}role_assignment_definition_lookup_enabled = {{{role_assignment_definition_lookup_enabled}}}{{/role_assignment_definition_lookup_enabled}}
  {{#role_assignments}}role_assignments                          = {{{role_assignments}}}{{/role_assignments}}
  {{#routing}}routing                                   = {{{routing}}}{{/routing}}
  {{#sas_policy}}sas_policy                                = {{{sas_policy}}}{{/sas_policy}}
  {{#sftp_enabled}}sftp_enabled                              = {{{sftp_enabled}}}{{/sftp_enabled}}
  {{#shared_access_key_enabled}}shared_access_key_enabled                 = {{{shared_access_key_enabled}}}{{/shared_access_key_enabled}}
  {{#shares}}shares                                    = {{{shares}}}{{/shares}}
  {{#static_website}}static_website                            = {{{static_website}}}{{/static_website}}
  {{#storage_data_lake_gen2_filesystems}}storage_data_lake_gen2_filesystems        = {{{storage_data_lake_gen2_filesystems}}}{{/storage_data_lake_gen2_filesystems}}
  {{#storage_management_policy_rule}}storage_management_policy_rule            = {{{storage_management_policy_rule}}}{{/storage_management_policy_rule}}
  {{#storage_management_policy_timeouts}}storage_management_policy_timeouts        = {{{storage_management_policy_timeouts}}}{{/storage_management_policy_timeouts}}
  {{#table_encryption_key_type}}table_encryption_key_type                 = {{{table_encryption_key_type}}}{{/table_encryption_key_type}}
  {{#table_properties}}table_properties                          = {{{table_properties}}}{{/table_properties}}
  {{#table_service_cors_propagation_wait}}table_service_cors_propagation_wait       = {{{table_service_cors_propagation_wait}}}{{/table_service_cors_propagation_wait}}
  {{#tables}}tables                                    = {{{tables}}}{{/tables}}
  {{#tags}}tags                                      = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                  = {{{timeouts}}}{{/timeouts}}
}
