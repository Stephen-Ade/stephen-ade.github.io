terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-eventgrid-domain" {
  source  = "Azure/avm-res-eventgrid-domain/azurerm"
  version = "0.1.0"

  {{#if location}}location                                  = {{hclVal location}}{{/if}}
  {{#if name}}name                                      = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                                 = {{hclVal parent_id}}{{/if}}
  {{#if auto_create_topic_with_first_subscription}}auto_create_topic_with_first_subscription = {{hclVal auto_create_topic_with_first_subscription}}{{/if}}
  {{#if auto_delete_topic_with_last_subscription}}auto_delete_topic_with_last_subscription  = {{hclVal auto_delete_topic_with_last_subscription}}{{/if}}
  {{#if data_residency_boundary}}data_residency_boundary                   = {{hclVal data_residency_boundary}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                       = {{hclVal diagnostic_settings}}{{/if}}
  {{#if disable_local_auth}}disable_local_auth                        = {{hclVal disable_local_auth}}{{/if}}
  {{#if domain_topics}}domain_topics                             = {{hclVal domain_topics}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                          = {{hclVal enable_telemetry}}{{/if}}
  {{#if event_type_info}}event_type_info                           = {{hclVal event_type_info}}{{/if}}
  {{#if inbound_ip_rules}}inbound_ip_rules                          = {{hclVal inbound_ip_rules}}{{/if}}
  {{#if input_schema}}input_schema                              = {{hclVal input_schema}}{{/if}}
  {{#if input_schema_mapping}}input_schema_mapping                      = {{hclVal input_schema_mapping}}{{/if}}
  {{#if lock}}lock                                      = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                        = {{hclVal managed_identities}}{{/if}}
  {{#if minimum_tls_version_allowed}}minimum_tls_version_allowed               = {{hclVal minimum_tls_version_allowed}}{{/if}}
  {{#if private_endpoints}}private_endpoints                         = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group   = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if properties}}properties                                = {{hclVal properties}}{{/if}}
  {{#if public_network_access}}public_network_access                     = {{hclVal public_network_access}}{{/if}}
  {{#if role_assignments}}role_assignments                          = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                      = {{hclVal tags}}{{/if}}
}
