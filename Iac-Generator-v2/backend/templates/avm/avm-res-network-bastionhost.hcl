terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-bastionhost" {
  source  = "Azure/avm-res-network-bastionhost/azurerm"
  version = "0.9.0"

  {{#location}}location                  = {{{location}}}{{/location}}
  {{#name}}name                      = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                 = {{{parent_id}}}{{/parent_id}}
  {{#copy_paste_enabled}}copy_paste_enabled        = {{{copy_paste_enabled}}}{{/copy_paste_enabled}}
  {{#diagnostic_settings}}diagnostic_settings       = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry          = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#file_copy_enabled}}file_copy_enabled         = {{{file_copy_enabled}}}{{/file_copy_enabled}}
  {{#ip_configuration}}ip_configuration          = {{{ip_configuration}}}{{/ip_configuration}}
  {{#ip_connect_enabled}}ip_connect_enabled        = {{{ip_connect_enabled}}}{{/ip_connect_enabled}}
  {{#kerberos_enabled}}kerberos_enabled          = {{{kerberos_enabled}}}{{/kerberos_enabled}}
  {{#lock}}lock                      = {{{lock}}}{{/lock}}
  {{#private_only_enabled}}private_only_enabled      = {{{private_only_enabled}}}{{/private_only_enabled}}
  {{#role_assignments}}role_assignments          = {{{role_assignments}}}{{/role_assignments}}
  {{#scale_units}}scale_units               = {{{scale_units}}}{{/scale_units}}
  {{#session_recording_enabled}}session_recording_enabled = {{{session_recording_enabled}}}{{/session_recording_enabled}}
  {{#shareable_link_enabled}}shareable_link_enabled    = {{{shareable_link_enabled}}}{{/shareable_link_enabled}}
  {{#sku}}sku                       = {{{sku}}}{{/sku}}
  {{#tags}}tags                      = {{{tags}}}{{/tags}}
  {{#tunneling_enabled}}tunneling_enabled         = {{{tunneling_enabled}}}{{/tunneling_enabled}}
  {{#virtual_network_id}}virtual_network_id        = {{{virtual_network_id}}}{{/virtual_network_id}}
  {{#zones}}zones                     = {{{zones}}}{{/zones}}
}
