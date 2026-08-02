terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_hybridcontainerservice_provisionedclusterinstance" {
  source  = "Azure/avm-res-hybridcontainerservice-provisionedclusterinstance/azurerm"
  version = "2.0.4"

  {{#if agent_pool_profiles}}agent_pool_profiles             = {{hclVal agent_pool_profiles}}{{/if}}
  {{#if custom_location_id}}custom_location_id              = {{hclVal custom_location_id}}{{/if}}
  {{#if location}}location                        = {{hclVal location}}{{/if}}
  {{#if logical_network_id}}logical_network_id              = {{hclVal logical_network_id}}{{/if}}
  {{#if name}}name                            = {{hclVal name}}{{/if}}
  {{#if resource_group_id}}resource_group_id               = {{hclVal resource_group_id}}{{/if}}
  {{#if additional_nodepools}}additional_nodepools            = {{hclVal additional_nodepools}}{{/if}}
  {{#if azure_hybrid_benefit}}azure_hybrid_benefit            = {{hclVal azure_hybrid_benefit}}{{/if}}
  {{#if control_plane_count}}control_plane_count             = {{hclVal control_plane_count}}{{/if}}
  {{#if control_plane_ip}}control_plane_ip                = {{hclVal control_plane_ip}}{{/if}}
  {{#if control_plane_vm_size}}control_plane_vm_size           = {{hclVal control_plane_vm_size}}{{/if}}
  {{#if enable_azure_rbac}}enable_azure_rbac               = {{hclVal enable_azure_rbac}}{{/if}}
  {{#if enable_oidc_issuer}}enable_oidc_issuer              = {{hclVal enable_oidc_issuer}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                = {{hclVal enable_telemetry}}{{/if}}
  {{#if enable_workload_identity}}enable_workload_identity        = {{hclVal enable_workload_identity}}{{/if}}
  {{#if is_exported}}is_exported                     = {{hclVal is_exported}}{{/if}}
  {{#if kubernetes_version}}kubernetes_version              = {{hclVal kubernetes_version}}{{/if}}
  {{#if lock}}lock                            = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities              = {{hclVal managed_identities}}{{/if}}
  {{#if nfs_csi_driver_enabled}}nfs_csi_driver_enabled          = {{hclVal nfs_csi_driver_enabled}}{{/if}}
  {{#if pod_cidr}}pod_cidr                        = {{hclVal pod_cidr}}{{/if}}
  {{#if rbac_admin_group_object_ids}}rbac_admin_group_object_ids     = {{hclVal rbac_admin_group_object_ids}}{{/if}}
  {{#if role_assignments}}role_assignments                = {{hclVal role_assignments}}{{/if}}
  {{#if smb_csi_driver_enabled}}smb_csi_driver_enabled          = {{hclVal smb_csi_driver_enabled}}{{/if}}
  {{#if ssh_key_vault_id}}ssh_key_vault_id                = {{hclVal ssh_key_vault_id}}{{/if}}
  {{#if ssh_private_key_pem_secret_name}}ssh_private_key_pem_secret_name = {{hclVal ssh_private_key_pem_secret_name}}{{/if}}
  {{#if ssh_public_key}}ssh_public_key                  = {{hclVal ssh_public_key}}{{/if}}
  {{#if ssh_public_key_secret_name}}ssh_public_key_secret_name      = {{hclVal ssh_public_key_secret_name}}{{/if}}
  {{#if tags}}tags                            = {{hclVal tags}}{{/if}}
  {{#if tenant_id}}tenant_id                       = {{hclVal tenant_id}}{{/if}}
}
