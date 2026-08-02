terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_web_site" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "0.22.0"

  {{#if location}}location                                       = {{hclVal location}}{{/if}}
  {{#if name}}name                                           = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                                      = {{hclVal parent_id}}{{/if}}
  {{#if service_plan_resource_id}}service_plan_resource_id                       = {{hclVal service_plan_resource_id}}{{/if}}
  {{#if all_child_resources_inherit_tags}}all_child_resources_inherit_tags               = {{hclVal all_child_resources_inherit_tags}}{{/if}}
  {{#if always_ready}}always_ready                                   = {{hclVal always_ready}}{{/if}}
  {{#if app_service_active_slot}}app_service_active_slot                        = {{hclVal app_service_active_slot}}{{/if}}
  {{#if app_settings}}app_settings                                   = {{hclVal app_settings}}{{/if}}
  {{#if application_insights_connection_string}}application_insights_connection_string         = {{hclVal application_insights_connection_string}}{{/if}}
  {{#if application_insights_key}}application_insights_key                       = {{hclVal application_insights_key}}{{/if}}
  {{#if auth_settings}}auth_settings                                  = {{hclVal auth_settings}}{{/if}}
  {{#if auth_settings_v2}}auth_settings_v2                               = {{hclVal auth_settings_v2}}{{/if}}
  {{#if auto_generated_domain_name_label_scope}}auto_generated_domain_name_label_scope         = {{hclVal auto_generated_domain_name_label_scope}}{{/if}}
  {{#if backup}}backup                                         = {{hclVal backup}}{{/if}}
  {{#if builtin_logging_enabled}}builtin_logging_enabled                        = {{hclVal builtin_logging_enabled}}{{/if}}
  {{#if bundle_version}}bundle_version                                 = {{hclVal bundle_version}}{{/if}}
  {{#if certificates}}certificates                                   = {{hclVal certificates}}{{/if}}
  {{#if client_affinity_enabled}}client_affinity_enabled                        = {{hclVal client_affinity_enabled}}{{/if}}
  {{#if client_affinity_partitioning_enabled}}client_affinity_partitioning_enabled           = {{hclVal client_affinity_partitioning_enabled}}{{/if}}
  {{#if client_affinity_proxy_enabled}}client_affinity_proxy_enabled                  = {{hclVal client_affinity_proxy_enabled}}{{/if}}
  {{#if client_certificate_enabled}}client_certificate_enabled                     = {{hclVal client_certificate_enabled}}{{/if}}
  {{#if client_certificate_exclusion_paths}}client_certificate_exclusion_paths             = {{hclVal client_certificate_exclusion_paths}}{{/if}}
  {{#if client_certificate_mode}}client_certificate_mode                        = {{hclVal client_certificate_mode}}{{/if}}
  {{#if connection_strings}}connection_strings                             = {{hclVal connection_strings}}{{/if}}
  {{#if container_size}}container_size                                 = {{hclVal container_size}}{{/if}}
  {{#if content_share_force_disabled}}content_share_force_disabled                   = {{hclVal content_share_force_disabled}}{{/if}}
  {{#if custom_domains}}custom_domains                                 = {{hclVal custom_domains}}{{/if}}
  {{#if daily_memory_time_quota}}daily_memory_time_quota                        = {{hclVal daily_memory_time_quota}}{{/if}}
  {{#if dapr_config}}dapr_config                                    = {{hclVal dapr_config}}{{/if}}
  {{#if deployment_slots}}deployment_slots                               = {{hclVal deployment_slots}}{{/if}}
  {{#if deployment_slots_inherit_lock}}deployment_slots_inherit_lock                  = {{hclVal deployment_slots_inherit_lock}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                            = {{hclVal diagnostic_settings}}{{/if}}
  {{#if dns_configuration}}dns_configuration                              = {{hclVal dns_configuration}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                               = {{hclVal enable_telemetry}}{{/if}}
  {{#if enabled}}enabled                                        = {{hclVal enabled}}{{/if}}
  {{#if end_to_end_encryption_enabled}}end_to_end_encryption_enabled                  = {{hclVal end_to_end_encryption_enabled}}{{/if}}
  {{#if fc1_runtime_name}}fc1_runtime_name                               = {{hclVal fc1_runtime_name}}{{/if}}
  {{#if fc1_runtime_version}}fc1_runtime_version                            = {{hclVal fc1_runtime_version}}{{/if}}
  {{#if ftp_publish_basic_authentication_enabled}}ftp_publish_basic_authentication_enabled       = {{hclVal ftp_publish_basic_authentication_enabled}}{{/if}}
  {{#if function_app_uses_fc1}}function_app_uses_fc1                          = {{hclVal function_app_uses_fc1}}{{/if}}
  {{#if functions_extension_version}}functions_extension_version                    = {{hclVal functions_extension_version}}{{/if}}
  {{#if host_names_disabled}}host_names_disabled                            = {{hclVal host_names_disabled}}{{/if}}
  {{#if hosting_environment_id}}hosting_environment_id                         = {{hclVal hosting_environment_id}}{{/if}}
  {{#if https_only}}https_only                                     = {{hclVal https_only}}{{/if}}
  {{#if hyper_v}}hyper_v                                        = {{hclVal hyper_v}}{{/if}}
  {{#if instance_memory_in_mb}}instance_memory_in_mb                          = {{hclVal instance_memory_in_mb}}{{/if}}
  {{#if ip_mode}}ip_mode                                        = {{hclVal ip_mode}}{{/if}}
  {{#if key_vault_reference_identity}}key_vault_reference_identity                   = {{hclVal key_vault_reference_identity}}{{/if}}
  {{#if kind}}kind                                           = {{hclVal kind}}{{/if}}
  {{#if lock}}lock                                           = {{hclVal lock}}{{/if}}
  {{#if logic_app_runtime_version}}logic_app_runtime_version                      = {{hclVal logic_app_runtime_version}}{{/if}}
  {{#if logs}}logs                                           = {{hclVal logs}}{{/if}}
  {{#if managed_environment_id}}managed_environment_id                         = {{hclVal managed_environment_id}}{{/if}}
  {{#if managed_identities}}managed_identities                             = {{hclVal managed_identities}}{{/if}}
  {{#if maximum_instance_count}}maximum_instance_count                         = {{hclVal maximum_instance_count}}{{/if}}
  {{#if os_type}}os_type                                        = {{hclVal os_type}}{{/if}}
  {{#if private_endpoints}}private_endpoints                              = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_inherit_lock}}private_endpoints_inherit_lock                 = {{hclVal private_endpoints_inherit_lock}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group        = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled                  = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if redundancy_mode}}redundancy_mode                                = {{hclVal redundancy_mode}}{{/if}}
  {{#if resource_config}}resource_config                                = {{hclVal resource_config}}{{/if}}
  {{#if retry}}retry                                          = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments                               = {{hclVal role_assignments}}{{/if}}
  {{#if scm_publish_basic_authentication_enabled}}scm_publish_basic_authentication_enabled       = {{hclVal scm_publish_basic_authentication_enabled}}{{/if}}
  {{#if scm_site_also_stopped}}scm_site_also_stopped                          = {{hclVal scm_site_also_stopped}}{{/if}}
  {{#if site_config}}site_config                                    = {{hclVal site_config}}{{/if}}
  {{#if slot_sensitive_app_settings}}slot_sensitive_app_settings                    = {{hclVal slot_sensitive_app_settings}}{{/if}}
  {{#if slots_storage_shares_to_mount_sensitive_values}}slots_storage_shares_to_mount_sensitive_values = {{hclVal slots_storage_shares_to_mount_sensitive_values}}{{/if}}
  {{#if ssh_enabled}}ssh_enabled                                    = {{hclVal ssh_enabled}}{{/if}}
  {{#if sticky_settings}}sticky_settings                                = {{hclVal sticky_settings}}{{/if}}
  {{#if storage_account_access_key}}storage_account_access_key                     = {{hclVal storage_account_access_key}}{{/if}}
  {{#if storage_account_name}}storage_account_name                           = {{hclVal storage_account_name}}{{/if}}
  {{#if storage_account_required}}storage_account_required                       = {{hclVal storage_account_required}}{{/if}}
  {{#if storage_account_share_name}}storage_account_share_name                     = {{hclVal storage_account_share_name}}{{/if}}
  {{#if storage_authentication_type}}storage_authentication_type                    = {{hclVal storage_authentication_type}}{{/if}}
  {{#if storage_container_endpoint}}storage_container_endpoint                     = {{hclVal storage_container_endpoint}}{{/if}}
  {{#if storage_container_type}}storage_container_type                         = {{hclVal storage_container_type}}{{/if}}
  {{#if storage_shares_to_mount}}storage_shares_to_mount                        = {{hclVal storage_shares_to_mount}}{{/if}}
  {{#if storage_user_assigned_identity_id}}storage_user_assigned_identity_id              = {{hclVal storage_user_assigned_identity_id}}{{/if}}
  {{#if storage_uses_managed_identity}}storage_uses_managed_identity                  = {{hclVal storage_uses_managed_identity}}{{/if}}
  {{#if tags}}tags                                           = {{hclVal tags}}{{/if}}
  {{#if use_extension_bundle}}use_extension_bundle                           = {{hclVal use_extension_bundle}}{{/if}}
  {{#if virtual_network_backup_restore_enabled}}virtual_network_backup_restore_enabled         = {{hclVal virtual_network_backup_restore_enabled}}{{/if}}
  {{#if virtual_network_subnet_id}}virtual_network_subnet_id                      = {{hclVal virtual_network_subnet_id}}{{/if}}
  {{#if vnet_application_traffic_enabled}}vnet_application_traffic_enabled               = {{hclVal vnet_application_traffic_enabled}}{{/if}}
  {{#if vnet_content_share_enabled}}vnet_content_share_enabled                     = {{hclVal vnet_content_share_enabled}}{{/if}}
  {{#if vnet_image_pull_enabled}}vnet_image_pull_enabled                        = {{hclVal vnet_image_pull_enabled}}{{/if}}
  {{#if vnet_route_all_traffic}}vnet_route_all_traffic                         = {{hclVal vnet_route_all_traffic}}{{/if}}
  {{#if workload_profile_name}}workload_profile_name                          = {{hclVal workload_profile_name}}{{/if}}
  {{#if zip_deploy_file}}zip_deploy_file                                = {{hclVal zip_deploy_file}}{{/if}}
  {{#if zip_deploy_wait_duration}}zip_deploy_wait_duration                       = {{hclVal zip_deploy_wait_duration}}{{/if}}
}
