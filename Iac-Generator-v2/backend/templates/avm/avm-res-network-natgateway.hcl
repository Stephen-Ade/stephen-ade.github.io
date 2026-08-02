terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-natgateway" {
  source  = "Azure/avm-res-network-natgateway/azurerm"
  version = "0.3.2"

  {{#location}}location                         = {{{location}}}{{/location}}
  {{#name}}name                             = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                        = {{{parent_id}}}{{/parent_id}}
  {{#diagnostic_settings}}diagnostic_settings              = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                 = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#idle_timeout_in_minutes}}idle_timeout_in_minutes          = {{{idle_timeout_in_minutes}}}{{/idle_timeout_in_minutes}}
  {{#lock}}lock                             = {{{lock}}}{{/lock}}
  {{#public_ip_configuration}}public_ip_configuration          = {{{public_ip_configuration}}}{{/public_ip_configuration}}
  {{#public_ip_prefix_resource_ids}}public_ip_prefix_resource_ids    = {{{public_ip_prefix_resource_ids}}}{{/public_ip_prefix_resource_ids}}
  {{#public_ip_prefix_v6_resource_ids}}public_ip_prefix_v6_resource_ids = {{{public_ip_prefix_v6_resource_ids}}}{{/public_ip_prefix_v6_resource_ids}}
  {{#public_ip_resource_ids}}public_ip_resource_ids           = {{{public_ip_resource_ids}}}{{/public_ip_resource_ids}}
  {{#public_ip_v6_resource_ids}}public_ip_v6_resource_ids        = {{{public_ip_v6_resource_ids}}}{{/public_ip_v6_resource_ids}}
  {{#public_ips}}public_ips                       = {{{public_ips}}}{{/public_ips}}
  {{#role_assignments}}role_assignments                 = {{{role_assignments}}}{{/role_assignments}}
  {{#sku_name}}sku_name                         = {{{sku_name}}}{{/sku_name}}
  {{#tags}}tags                             = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                         = {{{timeouts}}}{{/timeouts}}
  {{#zones}}zones                            = {{{zones}}}{{/zones}}
}
