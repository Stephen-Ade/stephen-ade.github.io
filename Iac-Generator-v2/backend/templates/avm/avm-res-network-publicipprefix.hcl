terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-publicipprefix" {
  source  = "Azure/avm-res-network-publicipprefix/azurerm"
  version = "0.1.0"

  {{#location}}location            = {{{location}}}{{/location}}
  {{#name}}name                = {{{name}}}{{/name}}
  {{#prefix_length}}prefix_length       = {{{prefix_length}}}{{/prefix_length}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#ip_version}}ip_version          = {{{ip_version}}}{{/ip_version}}
  {{#lock}}lock                = {{{lock}}}{{/lock}}
  {{#sku_name}}sku_name            = {{{sku_name}}}{{/sku_name}}
  {{#sku_tier}}sku_tier            = {{{sku_tier}}}{{/sku_tier}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
  {{#zones}}zones               = {{{zones}}}{{/zones}}
}
