terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-app-containerapp" {
  source  = "Azure/avm-res-app-containerapp/azurerm"
  version = "0.9.0"

  {{#container_app_environment_resource_id}}container_app_environment_resource_id = {{{container_app_environment_resource_id}}}{{/container_app_environment_resource_id}}
  {{#name}}name                                  = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                   = {{{resource_group_name}}}{{/resource_group_name}}
  {{#template}}template                              = {{{template}}}{{/template}}
  {{#auth_configs}}auth_configs                          = {{{auth_configs}}}{{/auth_configs}}
  {{#dapr}}dapr                                  = {{{dapr}}}{{/dapr}}
  {{#enable_telemetry}}enable_telemetry                      = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#identity_settings}}identity_settings                     = {{{identity_settings}}}{{/identity_settings}}
  {{#ingress}}ingress                               = {{{ingress}}}{{/ingress}}
  {{#kind}}kind                                  = {{{kind}}}{{/kind}}
  {{#location}}location                              = {{{location}}}{{/location}}
  {{#lock}}lock                                  = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                    = {{{managed_identities}}}{{/managed_identities}}
  {{#max_inactive_revisions}}max_inactive_revisions                = {{{max_inactive_revisions}}}{{/max_inactive_revisions}}
  {{#registries}}registries                            = {{{registries}}}{{/registries}}
  {{#resource_group_id}}resource_group_id                     = {{{resource_group_id}}}{{/resource_group_id}}
  {{#revision_mode}}revision_mode                         = {{{revision_mode}}}{{/revision_mode}}
  {{#role_assignments}}role_assignments                      = {{{role_assignments}}}{{/role_assignments}}
  {{#runtime}}runtime                               = {{{runtime}}}{{/runtime}}
  {{#secrets}}secrets                               = {{{secrets}}}{{/secrets}}
  {{#service}}service                               = {{{service}}}{{/service}}
  {{#tags}}tags                                  = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                              = {{{timeouts}}}{{/timeouts}}
  {{#workload_profile_name}}workload_profile_name                 = {{{workload_profile_name}}}{{/workload_profile_name}}
}
