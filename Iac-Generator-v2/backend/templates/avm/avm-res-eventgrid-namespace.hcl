terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-eventgrid-namespace" {
  source  = "Azure/avm-res-eventgrid-namespace/azurerm"
  version = "0.1.1"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                               = {{hclVal parent_id}}{{/if}}
  {{#if ca_certificates}}ca_certificates                         = {{hclVal ca_certificates}}{{/if}}
  {{#if capacity}}capacity                                = {{hclVal capacity}}{{/if}}
  {{#if client_groups}}client_groups                           = {{hclVal client_groups}}{{/if}}
  {{#if clients}}clients                                 = {{hclVal clients}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if inbound_ip_rules}}inbound_ip_rules                        = {{hclVal inbound_ip_rules}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if namespace_topics}}namespace_topics                        = {{hclVal namespace_topics}}{{/if}}
  {{#if permission_bindings}}permission_bindings                     = {{hclVal permission_bindings}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access}}public_network_access                   = {{hclVal public_network_access}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                                     = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if topic_event_subscriptions}}topic_event_subscriptions               = {{hclVal topic_event_subscriptions}}{{/if}}
  {{#if topic_spaces}}topic_spaces                            = {{hclVal topic_spaces}}{{/if}}
  {{#if topic_spaces_configuration}}topic_spaces_configuration              = {{hclVal topic_spaces_configuration}}{{/if}}
}
