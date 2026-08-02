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

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#application_insights}}application_insights                    = {{{application_insights}}}{{/application_insights}}
  {{#azure_ai_hub}}azure_ai_hub                            = {{{azure_ai_hub}}}{{/azure_ai_hub}}
  {{#container_registry}}container_registry                      = {{{container_registry}}}{{/container_registry}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#hbi_workspace}}hbi_workspace                           = {{{hbi_workspace}}}{{/hbi_workspace}}
  {{#image_build_compute}}image_build_compute                     = {{{image_build_compute}}}{{/image_build_compute}}
  {{#ip_allowlist}}ip_allowlist                            = {{{ip_allowlist}}}{{/ip_allowlist}}
  {{#is_private}}is_private                              = {{{is_private}}}{{/is_private}}
  {{#key_vault}}key_vault                               = {{{key_vault}}}{{/key_vault}}
  {{#kind}}kind                                    = {{{kind}}}{{/kind}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#outbound_rules}}outbound_rules                          = {{{outbound_rules}}}{{/outbound_rules}}
  {{#primary_user_assigned_identity}}primary_user_assigned_identity          = {{{primary_user_assigned_identity}}}{{/primary_user_assigned_identity}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#provision_network_now_enabled}}provision_network_now_enabled           = {{{provision_network_now_enabled}}}{{/provision_network_now_enabled}}
  {{#public_access_when_behind_vnet_enabled}}public_access_when_behind_vnet_enabled  = {{{public_access_when_behind_vnet_enabled}}}{{/public_access_when_behind_vnet_enabled}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#serverless_compute}}serverless_compute                      = {{{serverless_compute}}}{{/serverless_compute}}
  {{#service_side_cmk_encryption_enabled}}service_side_cmk_encryption_enabled     = {{{service_side_cmk_encryption_enabled}}}{{/service_side_cmk_encryption_enabled}}
  {{#storage_access_type}}storage_access_type                     = {{{storage_access_type}}}{{/storage_access_type}}
  {{#storage_account}}storage_account                         = {{{storage_account}}}{{/storage_account}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                = {{{timeouts}}}{{/timeouts}}
  {{#workspace_description}}workspace_description                   = {{{workspace_description}}}{{/workspace_description}}
  {{#workspace_friendly_name}}workspace_friendly_name                 = {{{workspace_friendly_name}}}{{/workspace_friendly_name}}
  {{#workspace_managed_network}}workspace_managed_network               = {{{workspace_managed_network}}}{{/workspace_managed_network}}
}
