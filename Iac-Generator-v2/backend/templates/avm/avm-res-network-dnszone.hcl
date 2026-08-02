terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-dnszone" {
  source  = "Azure/avm-res-network-dnszone/azurerm"
  version = "0.2.1"

  {{#name}}name                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#a_records}}a_records           = {{{a_records}}}{{/a_records}}
  {{#aaaa_records}}aaaa_records        = {{{aaaa_records}}}{{/aaaa_records}}
  {{#caa_records}}caa_records         = {{{caa_records}}}{{/caa_records}}
  {{#cname_records}}cname_records       = {{{cname_records}}}{{/cname_records}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#mx_records}}mx_records          = {{{mx_records}}}{{/mx_records}}
  {{#ns_records}}ns_records          = {{{ns_records}}}{{/ns_records}}
  {{#ptr_records}}ptr_records         = {{{ptr_records}}}{{/ptr_records}}
  {{#srv_records}}srv_records         = {{{srv_records}}}{{/srv_records}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
  {{#txt_records}}txt_records         = {{{txt_records}}}{{/txt_records}}
}
