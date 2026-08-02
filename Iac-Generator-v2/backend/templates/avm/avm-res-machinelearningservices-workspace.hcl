terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-machinelearningservices-workspace" {
  source  = "Azure/avm-res-machinelearningservices-workspace/azurerm"
  version = "0.9.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if application_insights}}application_insights                    = {{hclVal application_insights}}{{/if}}
  {{#if azure_ai_hub}}azure_ai_hub                            = {{hclVal azure_ai_hub}}{{/if}}
  {{#if container_registry}}container_registry                      = {{hclVal container_registry}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if hbi_workspace}}hbi_workspace                           = {{hclVal hbi_workspace}}{{/if}}
  {{#if image_build_compute}}image_build_compute                     = {{hclVal image_build_compute}}{{/if}}
  {{#if ip_allowlist}}ip_allowlist                            = {{hclVal ip_allowlist}}{{/if}}
  {{#if is_private}}is_private                              = {{hclVal is_private}}{{/if}}
  {{#if key_vault}}key_vault                               = {{hclVal key_vault}}{{/if}}
  {{#if kind}}kind                                    = {{hclVal kind}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if outbound_rules}}outbound_rules                          = {{hclVal outbound_rules}}{{/if}}
  {{#if primary_user_assigned_identity}}primary_user_assigned_identity          = {{hclVal primary_user_assigned_identity}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if provision_network_now_enabled}}provision_network_now_enabled           = {{hclVal provision_network_now_enabled}}{{/if}}
  {{#if public_access_when_behind_vnet_enabled}}public_access_when_behind_vnet_enabled  = {{hclVal public_access_when_behind_vnet_enabled}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if serverless_compute}}serverless_compute                      = {{hclVal serverless_compute}}{{/if}}
  {{#if service_side_cmk_encryption_enabled}}service_side_cmk_encryption_enabled     = {{hclVal service_side_cmk_encryption_enabled}}{{/if}}
  {{#if storage_access_type}}storage_access_type                     = {{hclVal storage_access_type}}{{/if}}
  {{#if storage_account}}storage_account                         = {{hclVal storage_account}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                = {{hclVal timeouts}}{{/if}}
  {{#if workspace_description}}workspace_description                   = {{hclVal workspace_description}}{{/if}}
  {{#if workspace_friendly_name}}workspace_friendly_name                 = {{hclVal workspace_friendly_name}}{{/if}}
  {{#if workspace_managed_network}}workspace_managed_network               = {{hclVal workspace_managed_network}}{{/if}}
}
