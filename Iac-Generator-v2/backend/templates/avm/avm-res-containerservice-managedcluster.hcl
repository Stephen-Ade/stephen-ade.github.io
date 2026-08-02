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

  {{#location}}location                                  = {{{location}}}{{/location}}
  {{#name}}name                                      = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                                 = {{{parent_id}}}{{/parent_id}}
  {{#aad_profile}}aad_profile                               = {{{aad_profile}}}{{/aad_profile}}
  {{#addon_profile_azure_policy}}addon_profile_azure_policy                = {{{addon_profile_azure_policy}}}{{/addon_profile_azure_policy}}
  {{#addon_profile_confidential_computing}}addon_profile_confidential_computing      = {{{addon_profile_confidential_computing}}}{{/addon_profile_confidential_computing}}
  {{#addon_profile_ingress_application_gateway}}addon_profile_ingress_application_gateway = {{{addon_profile_ingress_application_gateway}}}{{/addon_profile_ingress_application_gateway}}
  {{#addon_profile_key_vault_secrets_provider}}addon_profile_key_vault_secrets_provider  = {{{addon_profile_key_vault_secrets_provider}}}{{/addon_profile_key_vault_secrets_provider}}
  {{#addon_profile_oms_agent}}addon_profile_oms_agent                   = {{{addon_profile_oms_agent}}}{{/addon_profile_oms_agent}}
  {{#addon_profiles_extra}}addon_profiles_extra                      = {{{addon_profiles_extra}}}{{/addon_profiles_extra}}
  {{#agent_pools}}agent_pools                               = {{{agent_pools}}}{{/agent_pools}}
  {{#agentpool_timeouts}}agentpool_timeouts                        = {{{agentpool_timeouts}}}{{/agentpool_timeouts}}
  {{#ai_toolchain_operator_profile}}ai_toolchain_operator_profile             = {{{ai_toolchain_operator_profile}}}{{/ai_toolchain_operator_profile}}
  {{#alert_email}}alert_email                               = {{{alert_email}}}{{/alert_email}}
  {{#api_server_access_profile}}api_server_access_profile                 = {{{api_server_access_profile}}}{{/api_server_access_profile}}
  {{#auto_scaler_profile}}auto_scaler_profile                       = {{{auto_scaler_profile}}}{{/auto_scaler_profile}}
  {{#auto_upgrade_profile}}auto_upgrade_profile                      = {{{auto_upgrade_profile}}}{{/auto_upgrade_profile}}
  {{#azure_monitor_profile}}azure_monitor_profile                     = {{{azure_monitor_profile}}}{{/azure_monitor_profile}}
  {{#bootstrap_profile}}bootstrap_profile                         = {{{bootstrap_profile}}}{{/bootstrap_profile}}
  {{#cluster_timeouts}}cluster_timeouts                          = {{{cluster_timeouts}}}{{/cluster_timeouts}}
  {{#create_agentpools_before_destroy}}create_agentpools_before_destroy          = {{{create_agentpools_before_destroy}}}{{/create_agentpools_before_destroy}}
  {{#default_agent_pool}}default_agent_pool                        = {{{default_agent_pool}}}{{/default_agent_pool}}
  {{#diagnostic_settings}}diagnostic_settings                       = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#disable_local_accounts}}disable_local_accounts                    = {{{disable_local_accounts}}}{{/disable_local_accounts}}
  {{#disk_encryption_set_id}}disk_encryption_set_id                    = {{{disk_encryption_set_id}}}{{/disk_encryption_set_id}}
  {{#dns_prefix}}dns_prefix                                = {{{dns_prefix}}}{{/dns_prefix}}
  {{#enable_rbac}}enable_rbac                               = {{{enable_rbac}}}{{/enable_rbac}}
  {{#enable_telemetry}}enable_telemetry                          = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#extended_location}}extended_location                         = {{{extended_location}}}{{/extended_location}}
  {{#fqdn_subdomain}}fqdn_subdomain                            = {{{fqdn_subdomain}}}{{/fqdn_subdomain}}
  {{#hosted_system_profile}}hosted_system_profile                     = {{{hosted_system_profile}}}{{/hosted_system_profile}}
  {{#http_proxy_config}}http_proxy_config                         = {{{http_proxy_config}}}{{/http_proxy_config}}
  {{#identity_profile}}identity_profile                          = {{{identity_profile}}}{{/identity_profile}}
  {{#ingress_profile}}ingress_profile                           = {{{ingress_profile}}}{{/ingress_profile}}
  {{#kind}}kind                                      = {{{kind}}}{{/kind}}
  {{#kube_proxy_config}}kube_proxy_config                         = {{{kube_proxy_config}}}{{/kube_proxy_config}}
  {{#kubernetes_version}}kubernetes_version                        = {{{kubernetes_version}}}{{/kubernetes_version}}
  {{#linux_profile}}linux_profile                             = {{{linux_profile}}}{{/linux_profile}}
  {{#lock}}lock                                      = {{{lock}}}{{/lock}}
  {{#maintenanceconfiguration}}maintenanceconfiguration                  = {{{maintenanceconfiguration}}}{{/maintenanceconfiguration}}
  {{#managed_identities}}managed_identities                        = {{{managed_identities}}}{{/managed_identities}}
  {{#metrics_profile}}metrics_profile                           = {{{metrics_profile}}}{{/metrics_profile}}
  {{#namespace}}namespace                                 = {{{namespace}}}{{/namespace}}
  {{#network_profile}}network_profile                           = {{{network_profile}}}{{/network_profile}}
  {{#node_provisioning_profile}}node_provisioning_profile                 = {{{node_provisioning_profile}}}{{/node_provisioning_profile}}
  {{#node_resource_group}}node_resource_group                       = {{{node_resource_group}}}{{/node_resource_group}}
  {{#node_resource_group_profile}}node_resource_group_profile               = {{{node_resource_group_profile}}}{{/node_resource_group_profile}}
  {{#oidc_issuer_profile}}oidc_issuer_profile                       = {{{oidc_issuer_profile}}}{{/oidc_issuer_profile}}
  {{#onboard_alerts}}onboard_alerts                            = {{{onboard_alerts}}}{{/onboard_alerts}}
  {{#onboard_monitoring}}onboard_monitoring                        = {{{onboard_monitoring}}}{{/onboard_monitoring}}
  {{#pod_identity_profile}}pod_identity_profile                      = {{{pod_identity_profile}}}{{/pod_identity_profile}}
  {{#private_endpoints}}private_endpoints                         = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group   = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#private_link_resources}}private_link_resources                    = {{{private_link_resources}}}{{/private_link_resources}}
  {{#prometheus_workspace_id}}prometheus_workspace_id                   = {{{prometheus_workspace_id}}}{{/prometheus_workspace_id}}
  {{#public_network_access}}public_network_access                     = {{{public_network_access}}}{{/public_network_access}}
  {{#role_assignments}}role_assignments                          = {{{role_assignments}}}{{/role_assignments}}
  {{#security_profile}}security_profile                          = {{{security_profile}}}{{/security_profile}}
  {{#service_mesh_profile}}service_mesh_profile                      = {{{service_mesh_profile}}}{{/service_mesh_profile}}
  {{#service_principal_profile}}service_principal_profile                 = {{{service_principal_profile}}}{{/service_principal_profile}}
  {{#sku}}sku                                       = {{{sku}}}{{/sku}}
  {{#storage_profile}}storage_profile                           = {{{storage_profile}}}{{/storage_profile}}
  {{#support_plan}}support_plan                              = {{{support_plan}}}{{/support_plan}}
  {{#tags}}tags                                      = {{{tags}}}{{/tags}}
  {{#upgrade_settings}}upgrade_settings                          = {{{upgrade_settings}}}{{/upgrade_settings}}
  {{#windows_profile}}windows_profile                           = {{{windows_profile}}}{{/windows_profile}}
  {{#windows_profile_password}}windows_profile_password                  = {{{windows_profile_password}}}{{/windows_profile_password}}
  {{#windows_profile_password_version}}windows_profile_password_version          = {{{windows_profile_password_version}}}{{/windows_profile_password_version}}
  {{#workload_auto_scaler_profile}}workload_auto_scaler_profile              = {{{workload_auto_scaler_profile}}}{{/workload_auto_scaler_profile}}
}
