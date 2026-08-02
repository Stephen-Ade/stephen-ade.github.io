terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-hybridcontainerservice-provisionedclusterinstance" {
  source  = "Azure/avm-res-hybridcontainerservice-provisionedclusterinstance/azurerm"
  version = "2.0.4"

  {{#agent_pool_profiles}}agent_pool_profiles             = {{{agent_pool_profiles}}}{{/agent_pool_profiles}}
  {{#custom_location_id}}custom_location_id              = {{{custom_location_id}}}{{/custom_location_id}}
  {{#location}}location                        = {{{location}}}{{/location}}
  {{#logical_network_id}}logical_network_id              = {{{logical_network_id}}}{{/logical_network_id}}
  {{#name}}name                            = {{{name}}}{{/name}}
  {{#resource_group_id}}resource_group_id               = {{{resource_group_id}}}{{/resource_group_id}}
  {{#additional_nodepools}}additional_nodepools            = {{{additional_nodepools}}}{{/additional_nodepools}}
  {{#azure_hybrid_benefit}}azure_hybrid_benefit            = {{{azure_hybrid_benefit}}}{{/azure_hybrid_benefit}}
  {{#control_plane_count}}control_plane_count             = {{{control_plane_count}}}{{/control_plane_count}}
  {{#control_plane_ip}}control_plane_ip                = {{{control_plane_ip}}}{{/control_plane_ip}}
  {{#control_plane_vm_size}}control_plane_vm_size           = {{{control_plane_vm_size}}}{{/control_plane_vm_size}}
  {{#enable_azure_rbac}}enable_azure_rbac               = {{{enable_azure_rbac}}}{{/enable_azure_rbac}}
  {{#enable_oidc_issuer}}enable_oidc_issuer              = {{{enable_oidc_issuer}}}{{/enable_oidc_issuer}}
  {{#enable_telemetry}}enable_telemetry                = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#enable_workload_identity}}enable_workload_identity        = {{{enable_workload_identity}}}{{/enable_workload_identity}}
  {{#is_exported}}is_exported                     = {{{is_exported}}}{{/is_exported}}
  {{#kubernetes_version}}kubernetes_version              = {{{kubernetes_version}}}{{/kubernetes_version}}
  {{#lock}}lock                            = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities              = {{{managed_identities}}}{{/managed_identities}}
  {{#nfs_csi_driver_enabled}}nfs_csi_driver_enabled          = {{{nfs_csi_driver_enabled}}}{{/nfs_csi_driver_enabled}}
  {{#pod_cidr}}pod_cidr                        = {{{pod_cidr}}}{{/pod_cidr}}
  {{#rbac_admin_group_object_ids}}rbac_admin_group_object_ids     = {{{rbac_admin_group_object_ids}}}{{/rbac_admin_group_object_ids}}
  {{#role_assignments}}role_assignments                = {{{role_assignments}}}{{/role_assignments}}
  {{#smb_csi_driver_enabled}}smb_csi_driver_enabled          = {{{smb_csi_driver_enabled}}}{{/smb_csi_driver_enabled}}
  {{#ssh_key_vault_id}}ssh_key_vault_id                = {{{ssh_key_vault_id}}}{{/ssh_key_vault_id}}
  {{#ssh_private_key_pem_secret_name}}ssh_private_key_pem_secret_name = {{{ssh_private_key_pem_secret_name}}}{{/ssh_private_key_pem_secret_name}}
  {{#ssh_public_key}}ssh_public_key                  = {{{ssh_public_key}}}{{/ssh_public_key}}
  {{#ssh_public_key_secret_name}}ssh_public_key_secret_name      = {{{ssh_public_key_secret_name}}}{{/ssh_public_key_secret_name}}
  {{#tags}}tags                            = {{{tags}}}{{/tags}}
  {{#tenant_id}}tenant_id                       = {{{tenant_id}}}{{/tenant_id}}
}
