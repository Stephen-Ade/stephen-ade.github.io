terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_applicationgateway" {
  source  = "Azure/avm-res-network-applicationgateway/azurerm"
  version = "0.5.2"

  {{#if backend_address_pools}}backend_address_pools                 = {{hclVal backend_address_pools}}{{/if}}
  {{#if backend_http_settings}}backend_http_settings                 = {{hclVal backend_http_settings}}{{/if}}
  {{#if frontend_ports}}frontend_ports                        = {{hclVal frontend_ports}}{{/if}}
  {{#if gateway_ip_configuration}}gateway_ip_configuration              = {{hclVal gateway_ip_configuration}}{{/if}}
  {{#if http_listeners}}http_listeners                        = {{hclVal http_listeners}}{{/if}}
  {{#if location}}location                              = {{hclVal location}}{{/if}}
  {{#if name}}name                                  = {{hclVal name}}{{/if}}
  {{#if request_routing_rules}}request_routing_rules                 = {{hclVal request_routing_rules}}{{/if}}
  {{#if resource_group_name}}resource_group_name                   = {{hclVal resource_group_name}}{{/if}}
  {{#if app_gateway_waf_policy_resource_id}}app_gateway_waf_policy_resource_id    = {{hclVal app_gateway_waf_policy_resource_id}}{{/if}}
  {{#if authentication_certificate}}authentication_certificate            = {{hclVal authentication_certificate}}{{/if}}
  {{#if autoscale_configuration}}autoscale_configuration               = {{hclVal autoscale_configuration}}{{/if}}
  {{#if custom_error_configuration}}custom_error_configuration            = {{hclVal custom_error_configuration}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                   = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                      = {{hclVal enable_telemetry}}{{/if}}
  {{#if fips_enabled}}fips_enabled                          = {{hclVal fips_enabled}}{{/if}}
  {{#if force_firewall_policy_association}}force_firewall_policy_association     = {{hclVal force_firewall_policy_association}}{{/if}}
  {{#if frontend_ip_configuration_private}}frontend_ip_configuration_private     = {{hclVal frontend_ip_configuration_private}}{{/if}}
  {{#if frontend_ip_configuration_public_name}}frontend_ip_configuration_public_name = {{hclVal frontend_ip_configuration_public_name}}{{/if}}
  {{#if global}}global                                = {{hclVal global}}{{/if}}
  {{#if http2_enable}}http2_enable                          = {{hclVal http2_enable}}{{/if}}
  {{#if lock}}lock                                  = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                    = {{hclVal managed_identities}}{{/if}}
  {{#if private_link_configuration}}private_link_configuration            = {{hclVal private_link_configuration}}{{/if}}
  {{#if probe_configurations}}probe_configurations                  = {{hclVal probe_configurations}}{{/if}}
  {{#if public_ip_address_configuration}}public_ip_address_configuration       = {{hclVal public_ip_address_configuration}}{{/if}}
  {{#if redirect_configuration}}redirect_configuration                = {{hclVal redirect_configuration}}{{/if}}
  {{#if rewrite_rule_set}}rewrite_rule_set                      = {{hclVal rewrite_rule_set}}{{/if}}
  {{#if role_assignments}}role_assignments                      = {{hclVal role_assignments}}{{/if}}
  {{#if sku}}sku                                   = {{hclVal sku}}{{/if}}
  {{#if ssl_certificates}}ssl_certificates                      = {{hclVal ssl_certificates}}{{/if}}
  {{#if ssl_policy}}ssl_policy                            = {{hclVal ssl_policy}}{{/if}}
  {{#if ssl_profile}}ssl_profile                           = {{hclVal ssl_profile}}{{/if}}
  {{#if tags}}tags                                  = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                              = {{hclVal timeouts}}{{/if}}
  {{#if trusted_client_certificate}}trusted_client_certificate            = {{hclVal trusted_client_certificate}}{{/if}}
  {{#if trusted_root_certificate}}trusted_root_certificate              = {{hclVal trusted_root_certificate}}{{/if}}
  {{#if url_path_map_configurations}}url_path_map_configurations           = {{hclVal url_path_map_configurations}}{{/if}}
  {{#if waf_configuration}}waf_configuration                     = {{hclVal waf_configuration}}{{/if}}
  {{#if zones}}zones                                 = {{hclVal zones}}{{/if}}
}
