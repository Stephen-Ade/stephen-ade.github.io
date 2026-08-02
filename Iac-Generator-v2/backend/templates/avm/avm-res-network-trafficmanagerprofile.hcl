terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-trafficmanagerprofile" {
  source  = "Azure/avm-res-network-trafficmanagerprofile/azurerm"
  version = "0.1.0"

  {{#dns_config}}dns_config                     = {{{dns_config}}}{{/dns_config}}
  {{#monitor_config}}monitor_config                 = {{{monitor_config}}}{{/monitor_config}}
  {{#name}}name                           = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name            = {{{resource_group_name}}}{{/resource_group_name}}
  {{#traffic_routing_method}}traffic_routing_method         = {{{traffic_routing_method}}}{{/traffic_routing_method}}
  {{#allowed_endpoint_record_types}}allowed_endpoint_record_types  = {{{allowed_endpoint_record_types}}}{{/allowed_endpoint_record_types}}
  {{#azure_endpoints}}azure_endpoints                = {{{azure_endpoints}}}{{/azure_endpoints}}
  {{#diagnostic_settings}}diagnostic_settings            = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry               = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#external_endpoints}}external_endpoints             = {{{external_endpoints}}}{{/external_endpoints}}
  {{#lock}}lock                           = {{{lock}}}{{/lock}}
  {{#max_return}}max_return                     = {{{max_return}}}{{/max_return}}
  {{#nested_endpoints}}nested_endpoints               = {{{nested_endpoints}}}{{/nested_endpoints}}
  {{#profile_status}}profile_status                 = {{{profile_status}}}{{/profile_status}}
  {{#role_assignments}}role_assignments               = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                           = {{{tags}}}{{/tags}}
  {{#traffic_view_enrollment_status}}traffic_view_enrollment_status = {{{traffic_view_enrollment_status}}}{{/traffic_view_enrollment_status}}
}
