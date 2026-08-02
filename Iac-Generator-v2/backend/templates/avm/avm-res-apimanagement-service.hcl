terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_apimanagement_service" {
  source  = "Azure/avm-res-apimanagement-service/azurerm"
  version = "0.9.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if publisher_email}}publisher_email                         = {{hclVal publisher_email}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if additional_location}}additional_location                     = {{hclVal additional_location}}{{/if}}
  {{#if api_version_sets}}api_version_sets                        = {{hclVal api_version_sets}}{{/if}}
  {{#if apis}}apis                                    = {{hclVal apis}}{{/if}}
  {{#if backends}}backends                                = {{hclVal backends}}{{/if}}
  {{#if certificate}}certificate                             = {{hclVal certificate}}{{/if}}
  {{#if client_certificate_enabled}}client_certificate_enabled              = {{hclVal client_certificate_enabled}}{{/if}}
  {{#if delegation}}delegation                              = {{hclVal delegation}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if gateway_disabled}}gateway_disabled                        = {{hclVal gateway_disabled}}{{/if}}
  {{#if hostname_configuration}}hostname_configuration                  = {{hclVal hostname_configuration}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if min_api_version}}min_api_version                         = {{hclVal min_api_version}}{{/if}}
  {{#if named_values}}named_values                            = {{hclVal named_values}}{{/if}}
  {{#if notification_sender_email}}notification_sender_email               = {{hclVal notification_sender_email}}{{/if}}
  {{#if policy}}policy                                  = {{hclVal policy}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if products}}products                                = {{hclVal products}}{{/if}}
  {{#if protocols}}protocols                               = {{hclVal protocols}}{{/if}}
  {{#if public_ip_address_id}}public_ip_address_id                    = {{hclVal public_ip_address_id}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled           = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if publisher_name}}publisher_name                          = {{hclVal publisher_name}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if security}}security                                = {{hclVal security}}{{/if}}
  {{#if sign_in}}sign_in                                 = {{hclVal sign_in}}{{/if}}
  {{#if sign_up}}sign_up                                 = {{hclVal sign_up}}{{/if}}
  {{#if sku_name}}sku_name                                = {{hclVal sku_name}}{{/if}}
  {{#if subscriptions}}subscriptions                           = {{hclVal subscriptions}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if tenant_access}}tenant_access                           = {{hclVal tenant_access}}{{/if}}
  {{#if virtual_network_subnet_id}}virtual_network_subnet_id               = {{hclVal virtual_network_subnet_id}}{{/if}}
  {{#if virtual_network_type}}virtual_network_type                    = {{hclVal virtual_network_type}}{{/if}}
  {{#if zones}}zones                                   = {{hclVal zones}}{{/if}}
}
