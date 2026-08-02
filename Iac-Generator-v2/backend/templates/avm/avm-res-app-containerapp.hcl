terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_app_containerapp" {
  source  = "Azure/avm-res-app-containerapp/azurerm"
  version = "0.9.0"

  {{#if container_app_environment_resource_id}}container_app_environment_resource_id = {{hclVal container_app_environment_resource_id}}{{/if}}
  {{#if name}}name                                  = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                   = {{hclVal resource_group_name}}{{/if}}
  {{#if template}}template                              = {{hclVal template}}{{/if}}
  {{#if auth_configs}}auth_configs                          = {{hclVal auth_configs}}{{/if}}
  {{#if dapr}}dapr                                  = {{hclVal dapr}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                      = {{hclVal enable_telemetry}}{{/if}}
  {{#if identity_settings}}identity_settings                     = {{hclVal identity_settings}}{{/if}}
  {{#if ingress}}ingress                               = {{hclVal ingress}}{{/if}}
  {{#if kind}}kind                                  = {{hclVal kind}}{{/if}}
  {{#if location}}location                              = {{hclVal location}}{{/if}}
  {{#if lock}}lock                                  = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                    = {{hclVal managed_identities}}{{/if}}
  {{#if max_inactive_revisions}}max_inactive_revisions                = {{hclVal max_inactive_revisions}}{{/if}}
  {{#if registries}}registries                            = {{hclVal registries}}{{/if}}
  {{#if resource_group_id}}resource_group_id                     = {{hclVal resource_group_id}}{{/if}}
  {{#if revision_mode}}revision_mode                         = {{hclVal revision_mode}}{{/if}}
  {{#if role_assignments}}role_assignments                      = {{hclVal role_assignments}}{{/if}}
  {{#if runtime}}runtime                               = {{hclVal runtime}}{{/if}}
  {{#if secrets}}secrets                               = {{hclVal secrets}}{{/if}}
  {{#if service}}service                               = {{hclVal service}}{{/if}}
  {{#if tags}}tags                                  = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                              = {{hclVal timeouts}}{{/if}}
  {{#if workload_profile_name}}workload_profile_name                 = {{hclVal workload_profile_name}}{{/if}}
}
