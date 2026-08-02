terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_trafficmanagerprofile" {
  source  = "Azure/avm-res-network-trafficmanagerprofile/azurerm"
  version = "0.1.0"

  {{#if dns_config}}dns_config                     = {{hclVal dns_config}}{{/if}}
  {{#if monitor_config}}monitor_config                 = {{hclVal monitor_config}}{{/if}}
  {{#if name}}name                           = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name            = {{hclVal resource_group_name}}{{/if}}
  {{#if traffic_routing_method}}traffic_routing_method         = {{hclVal traffic_routing_method}}{{/if}}
  {{#if allowed_endpoint_record_types}}allowed_endpoint_record_types  = {{hclVal allowed_endpoint_record_types}}{{/if}}
  {{#if azure_endpoints}}azure_endpoints                = {{hclVal azure_endpoints}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings            = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry               = {{hclVal enable_telemetry}}{{/if}}
  {{#if external_endpoints}}external_endpoints             = {{hclVal external_endpoints}}{{/if}}
  {{#if lock}}lock                           = {{hclVal lock}}{{/if}}
  {{#if max_return}}max_return                     = {{hclVal max_return}}{{/if}}
  {{#if nested_endpoints}}nested_endpoints               = {{hclVal nested_endpoints}}{{/if}}
  {{#if profile_status}}profile_status                 = {{hclVal profile_status}}{{/if}}
  {{#if role_assignments}}role_assignments               = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                           = {{hclVal tags}}{{/if}}
  {{#if traffic_view_enrollment_status}}traffic_view_enrollment_status = {{hclVal traffic_view_enrollment_status}}{{/if}}
}
