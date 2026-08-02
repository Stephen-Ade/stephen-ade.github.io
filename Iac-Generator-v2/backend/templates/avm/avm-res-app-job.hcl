terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-app-job" {
  source  = "Azure/avm-res-app-job/azurerm"
  version = "0.2.1"

  {{#container_app_environment_resource_id}}container_app_environment_resource_id = {{{container_app_environment_resource_id}}}{{/container_app_environment_resource_id}}
  {{#location}}location                              = {{{location}}}{{/location}}
  {{#name}}name                                  = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                   = {{{resource_group_name}}}{{/resource_group_name}}
  {{#template}}template                              = {{{template}}}{{/template}}
  {{#enable_telemetry}}enable_telemetry                      = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#managed_identities}}managed_identities                    = {{{managed_identities}}}{{/managed_identities}}
  {{#registries}}registries                            = {{{registries}}}{{/registries}}
  {{#replica_retry_limit}}replica_retry_limit                   = {{{replica_retry_limit}}}{{/replica_retry_limit}}
  {{#replica_timeout_in_seconds}}replica_timeout_in_seconds            = {{{replica_timeout_in_seconds}}}{{/replica_timeout_in_seconds}}
  {{#secrets}}secrets                               = {{{secrets}}}{{/secrets}}
  {{#tags}}tags                                  = {{{tags}}}{{/tags}}
  {{#trigger_config}}trigger_config                        = {{{trigger_config}}}{{/trigger_config}}
  {{#workload_profile_name}}workload_profile_name                 = {{{workload_profile_name}}}{{/workload_profile_name}}
}
