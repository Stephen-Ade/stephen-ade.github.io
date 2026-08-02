terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-containerservice-managedcluster" {
  source  = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version = "0.7.1"

  {{#if location}}location                                  = {{hclVal location}}{{/if}}
  {{#if name}}name                                      = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                                 = {{hclVal parent_id}}{{/if}}
  {{#if aad_profile}}aad_profile                               = {{hclVal aad_profile}}{{/if}}
  {{#if addon_profile_azure_policy}}addon_profile_azure_policy                = {{hclVal addon_profile_azure_policy}}{{/if}}
  {{#if addon_profile_confidential_computing}}addon_profile_confidential_computing      = {{hclVal addon_profile_confidential_computing}}{{/if}}
  {{#if addon_profile_ingress_application_gateway}}addon_profile_ingress_application_gateway = {{hclVal addon_profile_ingress_application_gateway}}{{/if}}
  {{#if addon_profile_key_vault_secrets_provider}}addon_profile_key_vault_secrets_provider  = {{hclVal addon_profile_key_vault_secrets_provider}}{{/if}}
  {{#if addon_profile_oms_agent}}addon_profile_oms_agent                   = {{hclVal addon_profile_oms_agent}}{{/if}}
  {{#if addon_profiles_extra}}addon_profiles_extra                      = {{hclVal addon_profiles_extra}}{{/if}}
  {{#if agent_pools}}agent_pools                               = {{hclVal agent_pools}}{{/if}}
  {{#if agentpool_timeouts}}agentpool_timeouts                        = {{hclVal agentpool_timeouts}}{{/if}}
  {{#if ai_toolchain_operator_profile}}ai_toolchain_operator_profile             = {{hclVal ai_toolchain_operator_profile}}{{/if}}
  {{#if alert_email}}alert_email                               = {{hclVal alert_email}}{{/if}}
  {{#if api_server_access_profile}}api_server_access_profile                 = {{hclVal api_server_access_profile}}{{/if}}
  {{#if auto_scaler_profile}}auto_scaler_profile                       = {{hclVal auto_scaler_profile}}{{/if}}
  {{#if auto_upgrade_profile}}auto_upgrade_profile                      = {{hclVal auto_upgrade_profile}}{{/if}}
  {{#if azure_monitor_profile}}azure_monitor_profile                     = {{hclVal azure_monitor_profile}}{{/if}}
  {{#if bootstrap_profile}}bootstrap_profile                         = {{hclVal bootstrap_profile}}{{/if}}
  {{#if cluster_timeouts}}cluster_timeouts                          = {{hclVal cluster_timeouts}}{{/if}}
  {{#if create_agentpools_before_destroy}}create_agentpools_before_destroy          = {{hclVal create_agentpools_before_destroy}}{{/if}}
  {{#if default_agent_pool}}default_agent_pool                        = {{hclVal default_agent_pool}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                       = {{hclVal diagnostic_settings}}{{/if}}
  {{#if disable_local_accounts}}disable_local_accounts                    = {{hclVal disable_local_accounts}}{{/if}}
  {{#if disk_encryption_set_id}}disk_encryption_set_id                    = {{hclVal disk_encryption_set_id}}{{/if}}
  {{#if dns_prefix}}dns_prefix                                = {{hclVal dns_prefix}}{{/if}}
  {{#if enable_rbac}}enable_rbac                               = {{hclVal enable_rbac}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                          = {{hclVal enable_telemetry}}{{/if}}
  {{#if extended_location}}extended_location                         = {{hclVal extended_location}}{{/if}}
  {{#if fqdn_subdomain}}fqdn_subdomain                            = {{hclVal fqdn_subdomain}}{{/if}}
  {{#if hosted_system_profile}}hosted_system_profile                     = {{hclVal hosted_system_profile}}{{/if}}
  {{#if http_proxy_config}}http_proxy_config                         = {{hclVal http_proxy_config}}{{/if}}
  {{#if identity_profile}}identity_profile                          = {{hclVal identity_profile}}{{/if}}
  {{#if ingress_profile}}ingress_profile                           = {{hclVal ingress_profile}}{{/if}}
  {{#if kind}}kind                                      = {{hclVal kind}}{{/if}}
  {{#if kube_proxy_config}}kube_proxy_config                         = {{hclVal kube_proxy_config}}{{/if}}
  {{#if kubernetes_version}}kubernetes_version                        = {{hclVal kubernetes_version}}{{/if}}
  {{#if linux_profile}}linux_profile                             = {{hclVal linux_profile}}{{/if}}
  {{#if lock}}lock                                      = {{hclVal lock}}{{/if}}
  {{#if maintenanceconfiguration}}maintenanceconfiguration                  = {{hclVal maintenanceconfiguration}}{{/if}}
  {{#if managed_identities}}managed_identities                        = {{hclVal managed_identities}}{{/if}}
  {{#if metrics_profile}}metrics_profile                           = {{hclVal metrics_profile}}{{/if}}
  {{#if namespace}}namespace                                 = {{hclVal namespace}}{{/if}}
  {{#if network_profile}}network_profile                           = {{hclVal network_profile}}{{/if}}
  {{#if node_provisioning_profile}}node_provisioning_profile                 = {{hclVal node_provisioning_profile}}{{/if}}
  {{#if node_resource_group}}node_resource_group                       = {{hclVal node_resource_group}}{{/if}}
  {{#if node_resource_group_profile}}node_resource_group_profile               = {{hclVal node_resource_group_profile}}{{/if}}
  {{#if oidc_issuer_profile}}oidc_issuer_profile                       = {{hclVal oidc_issuer_profile}}{{/if}}
  {{#if onboard_alerts}}onboard_alerts                            = {{hclVal onboard_alerts}}{{/if}}
  {{#if onboard_monitoring}}onboard_monitoring                        = {{hclVal onboard_monitoring}}{{/if}}
  {{#if pod_identity_profile}}pod_identity_profile                      = {{hclVal pod_identity_profile}}{{/if}}
  {{#if private_endpoints}}private_endpoints                         = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group   = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if private_link_resources}}private_link_resources                    = {{hclVal private_link_resources}}{{/if}}
  {{#if prometheus_workspace_id}}prometheus_workspace_id                   = {{hclVal prometheus_workspace_id}}{{/if}}
  {{#if public_network_access}}public_network_access                     = {{hclVal public_network_access}}{{/if}}
  {{#if role_assignments}}role_assignments                          = {{hclVal role_assignments}}{{/if}}
  {{#if security_profile}}security_profile                          = {{hclVal security_profile}}{{/if}}
  {{#if service_mesh_profile}}service_mesh_profile                      = {{hclVal service_mesh_profile}}{{/if}}
  {{#if service_principal_profile}}service_principal_profile                 = {{hclVal service_principal_profile}}{{/if}}
  {{#if sku}}sku                                       = {{hclVal sku}}{{/if}}
  {{#if storage_profile}}storage_profile                           = {{hclVal storage_profile}}{{/if}}
  {{#if support_plan}}support_plan                              = {{hclVal support_plan}}{{/if}}
  {{#if tags}}tags                                      = {{hclVal tags}}{{/if}}
  {{#if upgrade_settings}}upgrade_settings                          = {{hclVal upgrade_settings}}{{/if}}
  {{#if windows_profile}}windows_profile                           = {{hclVal windows_profile}}{{/if}}
  {{#if windows_profile_password}}windows_profile_password                  = {{hclVal windows_profile_password}}{{/if}}
  {{#if windows_profile_password_version}}windows_profile_password_version          = {{hclVal windows_profile_password_version}}{{/if}}
  {{#if workload_auto_scaler_profile}}workload_auto_scaler_profile              = {{hclVal workload_auto_scaler_profile}}{{/if}}
}
