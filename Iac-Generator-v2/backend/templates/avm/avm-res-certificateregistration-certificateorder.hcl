terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-certificateregistration-certificateorder" {
  source  = "Azure/avm-res-certificateregistration-certificateorder/azurerm"
  version = "0.1.0"

  {{#location}}location                           = {{{location}}}{{/location}}
  {{#name}}name                               = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                = {{{resource_group_name}}}{{/resource_group_name}}
  {{#auto_renew}}auto_renew                         = {{{auto_renew}}}{{/auto_renew}}
  {{#certificate_order_key_vault_stores}}certificate_order_key_vault_stores = {{{certificate_order_key_vault_stores}}}{{/certificate_order_key_vault_stores}}
  {{#csr}}csr                                = {{{csr}}}{{/csr}}
  {{#distinguished_name}}distinguished_name                 = {{{distinguished_name}}}{{/distinguished_name}}
  {{#enable_telemetry}}enable_telemetry                   = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#key_size}}key_size                           = {{{key_size}}}{{/key_size}}
  {{#lock}}lock                               = {{{lock}}}{{/lock}}
  {{#product_type}}product_type                       = {{{product_type}}}{{/product_type}}
  {{#role_assignments}}role_assignments                   = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                               = {{{tags}}}{{/tags}}
  {{#validity_in_years}}validity_in_years                  = {{{validity_in_years}}}{{/validity_in_years}}
}
