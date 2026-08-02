terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-applicationgateway" {
  source  = "Azure/avm-res-network-applicationgateway/azurerm"
  version = "0.5.2"

  {{#backend_address_pools}}backend_address_pools                 = {{{backend_address_pools}}}{{/backend_address_pools}}
  {{#backend_http_settings}}backend_http_settings                 = {{{backend_http_settings}}}{{/backend_http_settings}}
  {{#frontend_ports}}frontend_ports                        = {{{frontend_ports}}}{{/frontend_ports}}
  {{#gateway_ip_configuration}}gateway_ip_configuration              = {{{gateway_ip_configuration}}}{{/gateway_ip_configuration}}
  {{#http_listeners}}http_listeners                        = {{{http_listeners}}}{{/http_listeners}}
  {{#location}}location                              = {{{location}}}{{/location}}
  {{#name}}name                                  = {{{name}}}{{/name}}
  {{#request_routing_rules}}request_routing_rules                 = {{{request_routing_rules}}}{{/request_routing_rules}}
  {{#resource_group_name}}resource_group_name                   = {{{resource_group_name}}}{{/resource_group_name}}
  {{#app_gateway_waf_policy_resource_id}}app_gateway_waf_policy_resource_id    = {{{app_gateway_waf_policy_resource_id}}}{{/app_gateway_waf_policy_resource_id}}
  {{#authentication_certificate}}authentication_certificate            = {{{authentication_certificate}}}{{/authentication_certificate}}
  {{#autoscale_configuration}}autoscale_configuration               = {{{autoscale_configuration}}}{{/autoscale_configuration}}
  {{#custom_error_configuration}}custom_error_configuration            = {{{custom_error_configuration}}}{{/custom_error_configuration}}
  {{#diagnostic_settings}}diagnostic_settings                   = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                      = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#fips_enabled}}fips_enabled                          = {{{fips_enabled}}}{{/fips_enabled}}
  {{#force_firewall_policy_association}}force_firewall_policy_association     = {{{force_firewall_policy_association}}}{{/force_firewall_policy_association}}
  {{#frontend_ip_configuration_private}}frontend_ip_configuration_private     = {{{frontend_ip_configuration_private}}}{{/frontend_ip_configuration_private}}
  {{#frontend_ip_configuration_public_name}}frontend_ip_configuration_public_name = {{{frontend_ip_configuration_public_name}}}{{/frontend_ip_configuration_public_name}}
  {{#global}}global                                = {{{global}}}{{/global}}
  {{#http2_enable}}http2_enable                          = {{{http2_enable}}}{{/http2_enable}}
  {{#lock}}lock                                  = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                    = {{{managed_identities}}}{{/managed_identities}}
  {{#private_link_configuration}}private_link_configuration            = {{{private_link_configuration}}}{{/private_link_configuration}}
  {{#probe_configurations}}probe_configurations                  = {{{probe_configurations}}}{{/probe_configurations}}
  {{#public_ip_address_configuration}}public_ip_address_configuration       = {{{public_ip_address_configuration}}}{{/public_ip_address_configuration}}
  {{#redirect_configuration}}redirect_configuration                = {{{redirect_configuration}}}{{/redirect_configuration}}
  {{#rewrite_rule_set}}rewrite_rule_set                      = {{{rewrite_rule_set}}}{{/rewrite_rule_set}}
  {{#role_assignments}}role_assignments                      = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                                   = {{{sku}}}{{/sku}}
  {{#ssl_certificates}}ssl_certificates                      = {{{ssl_certificates}}}{{/ssl_certificates}}
  {{#ssl_policy}}ssl_policy                            = {{{ssl_policy}}}{{/ssl_policy}}
  {{#ssl_profile}}ssl_profile                           = {{{ssl_profile}}}{{/ssl_profile}}
  {{#tags}}tags                                  = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                              = {{{timeouts}}}{{/timeouts}}
  {{#trusted_client_certificate}}trusted_client_certificate            = {{{trusted_client_certificate}}}{{/trusted_client_certificate}}
  {{#trusted_root_certificate}}trusted_root_certificate              = {{{trusted_root_certificate}}}{{/trusted_root_certificate}}
  {{#url_path_map_configurations}}url_path_map_configurations           = {{{url_path_map_configurations}}}{{/url_path_map_configurations}}
  {{#waf_configuration}}waf_configuration                     = {{{waf_configuration}}}{{/waf_configuration}}
  {{#zones}}zones                                 = {{{zones}}}{{/zones}}
}
