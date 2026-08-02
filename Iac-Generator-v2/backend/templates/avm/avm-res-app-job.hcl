terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_app_job" {
  source  = "Azure/avm-res-app-job/azurerm"
  version = "0.2.1"

  {{#if container_app_environment_resource_id}}container_app_environment_resource_id = {{hclVal container_app_environment_resource_id}}{{/if}}
  {{#if location}}location                              = {{hclVal location}}{{/if}}
  {{#if name}}name                                  = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                   = {{hclVal resource_group_name}}{{/if}}
  {{#if template}}template                              = {{hclVal template}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                      = {{hclVal enable_telemetry}}{{/if}}
  {{#if managed_identities}}managed_identities                    = {{hclVal managed_identities}}{{/if}}
  {{#if registries}}registries                            = {{hclVal registries}}{{/if}}
  {{#if replica_retry_limit}}replica_retry_limit                   = {{hclVal replica_retry_limit}}{{/if}}
  {{#if replica_timeout_in_seconds}}replica_timeout_in_seconds            = {{hclVal replica_timeout_in_seconds}}{{/if}}
  {{#if secrets}}secrets                               = {{hclVal secrets}}{{/if}}
  {{#if tags}}tags                                  = {{hclVal tags}}{{/if}}
  {{#if trigger_config}}trigger_config                        = {{hclVal trigger_config}}{{/if}}
  {{#if workload_profile_name}}workload_profile_name                 = {{hclVal workload_profile_name}}{{/if}}
}
