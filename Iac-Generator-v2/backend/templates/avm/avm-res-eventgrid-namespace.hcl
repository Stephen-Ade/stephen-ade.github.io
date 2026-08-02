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

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                               = {{{parent_id}}}{{/parent_id}}
  {{#ca_certificates}}ca_certificates                         = {{{ca_certificates}}}{{/ca_certificates}}
  {{#capacity}}capacity                                = {{{capacity}}}{{/capacity}}
  {{#client_groups}}client_groups                           = {{{client_groups}}}{{/client_groups}}
  {{#clients}}clients                                 = {{{clients}}}{{/clients}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#inbound_ip_rules}}inbound_ip_rules                        = {{{inbound_ip_rules}}}{{/inbound_ip_rules}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#namespace_topics}}namespace_topics                        = {{{namespace_topics}}}{{/namespace_topics}}
  {{#permission_bindings}}permission_bindings                     = {{{permission_bindings}}}{{/permission_bindings}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access}}public_network_access                   = {{{public_network_access}}}{{/public_network_access}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                                     = {{{sku}}}{{/sku}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#topic_event_subscriptions}}topic_event_subscriptions               = {{{topic_event_subscriptions}}}{{/topic_event_subscriptions}}
  {{#topic_spaces}}topic_spaces                            = {{{topic_spaces}}}{{/topic_spaces}}
  {{#topic_spaces_configuration}}topic_spaces_configuration              = {{{topic_spaces_configuration}}}{{/topic_spaces_configuration}}
}
