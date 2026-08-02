terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-cognitiveservices-account" {
  source  = "Azure/avm-res-cognitiveservices-account/azurerm"
  version = "0.11.1"

  {{#kind}}kind                                         = {{{kind}}}{{/kind}}
  {{#location}}location                                     = {{{location}}}{{/location}}
  {{#name}}name                                         = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                                    = {{{parent_id}}}{{/parent_id}}
  {{#sku_name}}sku_name                                     = {{{sku_name}}}{{/sku_name}}
  {{#allow_project_management}}allow_project_management                     = {{{allow_project_management}}}{{/allow_project_management}}
  {{#aml_workspace}}aml_workspace                                = {{{aml_workspace}}}{{/aml_workspace}}
  {{#associated_projects}}associated_projects                          = {{{associated_projects}}}{{/associated_projects}}
  {{#cognitive_deployments}}cognitive_deployments                        = {{{cognitive_deployments}}}{{/cognitive_deployments}}
  {{#custom_question_answering_search_service_id}}custom_question_answering_search_service_id  = {{{custom_question_answering_search_service_id}}}{{/custom_question_answering_search_service_id}}
  {{#custom_question_answering_search_service_key}}custom_question_answering_search_service_key = {{{custom_question_answering_search_service_key}}}{{/custom_question_answering_search_service_key}}
  {{#custom_subdomain_name}}custom_subdomain_name                        = {{{custom_subdomain_name}}}{{/custom_subdomain_name}}
  {{#default_project}}default_project                              = {{{default_project}}}{{/default_project}}
  {{#deployment_serialization_enabled}}deployment_serialization_enabled             = {{{deployment_serialization_enabled}}}{{/deployment_serialization_enabled}}
  {{#diagnostic_settings}}diagnostic_settings                          = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#dynamic_throttling_enabled}}dynamic_throttling_enabled                   = {{{dynamic_throttling_enabled}}}{{/dynamic_throttling_enabled}}
  {{#enable_telemetry}}enable_telemetry                             = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#fqdns}}fqdns                                        = {{{fqdns}}}{{/fqdns}}
  {{#is_hsm_key}}is_hsm_key                                   = {{{is_hsm_key}}}{{/is_hsm_key}}
  {{#local_auth_enabled}}local_auth_enabled                           = {{{local_auth_enabled}}}{{/local_auth_enabled}}
  {{#lock}}lock                                         = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                           = {{{managed_identities}}}{{/managed_identities}}
  {{#metrics_advisor_aad_client_id}}metrics_advisor_aad_client_id                = {{{metrics_advisor_aad_client_id}}}{{/metrics_advisor_aad_client_id}}
  {{#metrics_advisor_aad_tenant_id}}metrics_advisor_aad_tenant_id                = {{{metrics_advisor_aad_tenant_id}}}{{/metrics_advisor_aad_tenant_id}}
  {{#metrics_advisor_super_user_name}}metrics_advisor_super_user_name              = {{{metrics_advisor_super_user_name}}}{{/metrics_advisor_super_user_name}}
  {{#metrics_advisor_website_name}}metrics_advisor_website_name                 = {{{metrics_advisor_website_name}}}{{/metrics_advisor_website_name}}
  {{#network_acls}}network_acls                                 = {{{network_acls}}}{{/network_acls}}
  {{#network_injections}}network_injections                           = {{{network_injections}}}{{/network_injections}}
  {{#outbound_network_access_restricted}}outbound_network_access_restricted           = {{{outbound_network_access_restricted}}}{{/outbound_network_access_restricted}}
  {{#private_endpoints}}private_endpoints                            = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group      = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access_enabled}}public_network_access_enabled                = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#qna_runtime_endpoint}}qna_runtime_endpoint                         = {{{qna_runtime_endpoint}}}{{/qna_runtime_endpoint}}
  {{#rai_monitor_config}}rai_monitor_config                           = {{{rai_monitor_config}}}{{/rai_monitor_config}}
  {{#rai_policies}}rai_policies                                 = {{{rai_policies}}}{{/rai_policies}}
  {{#retry}}retry                                        = {{{retry}}}{{/retry}}
  {{#role_assignments}}role_assignments                             = {{{role_assignments}}}{{/role_assignments}}
  {{#storage}}storage                                      = {{{storage}}}{{/storage}}
  {{#tags}}tags                                         = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                     = {{{timeouts}}}{{/timeouts}}
}
