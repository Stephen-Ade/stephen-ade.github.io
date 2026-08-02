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

  {{#location}}location                                  = {{{location}}}{{/location}}
  {{#name}}name                                      = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                                 = {{{parent_id}}}{{/parent_id}}
  {{#auto_create_topic_with_first_subscription}}auto_create_topic_with_first_subscription = {{{auto_create_topic_with_first_subscription}}}{{/auto_create_topic_with_first_subscription}}
  {{#auto_delete_topic_with_last_subscription}}auto_delete_topic_with_last_subscription  = {{{auto_delete_topic_with_last_subscription}}}{{/auto_delete_topic_with_last_subscription}}
  {{#data_residency_boundary}}data_residency_boundary                   = {{{data_residency_boundary}}}{{/data_residency_boundary}}
  {{#diagnostic_settings}}diagnostic_settings                       = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#disable_local_auth}}disable_local_auth                        = {{{disable_local_auth}}}{{/disable_local_auth}}
  {{#domain_topics}}domain_topics                             = {{{domain_topics}}}{{/domain_topics}}
  {{#enable_telemetry}}enable_telemetry                          = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#event_type_info}}event_type_info                           = {{{event_type_info}}}{{/event_type_info}}
  {{#inbound_ip_rules}}inbound_ip_rules                          = {{{inbound_ip_rules}}}{{/inbound_ip_rules}}
  {{#input_schema}}input_schema                              = {{{input_schema}}}{{/input_schema}}
  {{#input_schema_mapping}}input_schema_mapping                      = {{{input_schema_mapping}}}{{/input_schema_mapping}}
  {{#lock}}lock                                      = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                        = {{{managed_identities}}}{{/managed_identities}}
  {{#minimum_tls_version_allowed}}minimum_tls_version_allowed               = {{{minimum_tls_version_allowed}}}{{/minimum_tls_version_allowed}}
  {{#private_endpoints}}private_endpoints                         = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group   = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#properties}}properties                                = {{{properties}}}{{/properties}}
  {{#public_network_access}}public_network_access                     = {{{public_network_access}}}{{/public_network_access}}
  {{#role_assignments}}role_assignments                          = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                      = {{{tags}}}{{/tags}}
}
