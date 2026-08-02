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

  {{#if location}}location                  = {{hclVal location}}{{/if}}
  {{#if name}}name                      = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                 = {{hclVal parent_id}}{{/if}}
  {{#if copy_paste_enabled}}copy_paste_enabled        = {{hclVal copy_paste_enabled}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings       = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry          = {{hclVal enable_telemetry}}{{/if}}
  {{#if file_copy_enabled}}file_copy_enabled         = {{hclVal file_copy_enabled}}{{/if}}
  {{#if ip_configuration}}ip_configuration          = {{hclVal ip_configuration}}{{/if}}
  {{#if ip_connect_enabled}}ip_connect_enabled        = {{hclVal ip_connect_enabled}}{{/if}}
  {{#if kerberos_enabled}}kerberos_enabled          = {{hclVal kerberos_enabled}}{{/if}}
  {{#if lock}}lock                      = {{hclVal lock}}{{/if}}
  {{#if private_only_enabled}}private_only_enabled      = {{hclVal private_only_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments          = {{hclVal role_assignments}}{{/if}}
  {{#if scale_units}}scale_units               = {{hclVal scale_units}}{{/if}}
  {{#if session_recording_enabled}}session_recording_enabled = {{hclVal session_recording_enabled}}{{/if}}
  {{#if shareable_link_enabled}}shareable_link_enabled    = {{hclVal shareable_link_enabled}}{{/if}}
  {{#if sku}}sku                       = {{hclVal sku}}{{/if}}
  {{#if tags}}tags                      = {{hclVal tags}}{{/if}}
  {{#if tunneling_enabled}}tunneling_enabled         = {{hclVal tunneling_enabled}}{{/if}}
  {{#if virtual_network_id}}virtual_network_id        = {{hclVal virtual_network_id}}{{/if}}
  {{#if zones}}zones                     = {{hclVal zones}}{{/if}}
}
