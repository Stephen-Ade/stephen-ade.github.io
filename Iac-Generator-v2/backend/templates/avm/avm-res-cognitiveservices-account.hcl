terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_cognitiveservices_account" {
  source  = "Azure/avm-res-cognitiveservices-account/azurerm"
  version = "0.11.1"

  {{#if kind}}kind                                         = {{hclVal kind}}{{/if}}
  {{#if location}}location                                     = {{hclVal location}}{{/if}}
  {{#if name}}name                                         = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                                    = {{hclVal parent_id}}{{/if}}
  {{#if sku_name}}sku_name                                     = {{hclVal sku_name}}{{/if}}
  {{#if allow_project_management}}allow_project_management                     = {{hclVal allow_project_management}}{{/if}}
  {{#if aml_workspace}}aml_workspace                                = {{hclVal aml_workspace}}{{/if}}
  {{#if associated_projects}}associated_projects                          = {{hclVal associated_projects}}{{/if}}
  {{#if cognitive_deployments}}cognitive_deployments                        = {{hclVal cognitive_deployments}}{{/if}}
  {{#if custom_question_answering_search_service_id}}custom_question_answering_search_service_id  = {{hclVal custom_question_answering_search_service_id}}{{/if}}
  {{#if custom_question_answering_search_service_key}}custom_question_answering_search_service_key = {{hclVal custom_question_answering_search_service_key}}{{/if}}
  {{#if custom_subdomain_name}}custom_subdomain_name                        = {{hclVal custom_subdomain_name}}{{/if}}
  {{#if default_project}}default_project                              = {{hclVal default_project}}{{/if}}
  {{#if deployment_serialization_enabled}}deployment_serialization_enabled             = {{hclVal deployment_serialization_enabled}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                          = {{hclVal diagnostic_settings}}{{/if}}
  {{#if dynamic_throttling_enabled}}dynamic_throttling_enabled                   = {{hclVal dynamic_throttling_enabled}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                             = {{hclVal enable_telemetry}}{{/if}}
  {{#if fqdns}}fqdns                                        = {{hclVal fqdns}}{{/if}}
  {{#if is_hsm_key}}is_hsm_key                                   = {{hclVal is_hsm_key}}{{/if}}
  {{#if local_auth_enabled}}local_auth_enabled                           = {{hclVal local_auth_enabled}}{{/if}}
  {{#if lock}}lock                                         = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                           = {{hclVal managed_identities}}{{/if}}
  {{#if metrics_advisor_aad_client_id}}metrics_advisor_aad_client_id                = {{hclVal metrics_advisor_aad_client_id}}{{/if}}
  {{#if metrics_advisor_aad_tenant_id}}metrics_advisor_aad_tenant_id                = {{hclVal metrics_advisor_aad_tenant_id}}{{/if}}
  {{#if metrics_advisor_super_user_name}}metrics_advisor_super_user_name              = {{hclVal metrics_advisor_super_user_name}}{{/if}}
  {{#if metrics_advisor_website_name}}metrics_advisor_website_name                 = {{hclVal metrics_advisor_website_name}}{{/if}}
  {{#if network_acls}}network_acls                                 = {{hclVal network_acls}}{{/if}}
  {{#if network_injections}}network_injections                           = {{hclVal network_injections}}{{/if}}
  {{#if outbound_network_access_restricted}}outbound_network_access_restricted           = {{hclVal outbound_network_access_restricted}}{{/if}}
  {{#if private_endpoints}}private_endpoints                            = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group      = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled                = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if qna_runtime_endpoint}}qna_runtime_endpoint                         = {{hclVal qna_runtime_endpoint}}{{/if}}
  {{#if rai_monitor_config}}rai_monitor_config                           = {{hclVal rai_monitor_config}}{{/if}}
  {{#if rai_policies}}rai_policies                                 = {{hclVal rai_policies}}{{/if}}
  {{#if retry}}retry                                        = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments                             = {{hclVal role_assignments}}{{/if}}
  {{#if storage}}storage                                      = {{hclVal storage}}{{/if}}
  {{#if tags}}tags                                         = {{hclVal tags}}{{/if}}
}
