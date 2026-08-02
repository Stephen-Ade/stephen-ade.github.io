terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-publicipaddress" {
  source  = "Azure/avm-res-network-publicipaddress/azurerm"
  version = "0.2.1"

  {{#location}}location                = {{{location}}}{{/location}}
  {{#name}}name                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#allocation_method}}allocation_method       = {{{allocation_method}}}{{/allocation_method}}
  {{#ddos_protection_mode}}ddos_protection_mode    = {{{ddos_protection_mode}}}{{/ddos_protection_mode}}
  {{#ddos_protection_plan_id}}ddos_protection_plan_id = {{{ddos_protection_plan_id}}}{{/ddos_protection_plan_id}}
  {{#diagnostic_settings}}diagnostic_settings     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#domain_name_label}}domain_name_label       = {{{domain_name_label}}}{{/domain_name_label}}
  {{#edge_zone}}edge_zone               = {{{edge_zone}}}{{/edge_zone}}
  {{#enable_telemetry}}enable_telemetry        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#idle_timeout_in_minutes}}idle_timeout_in_minutes = {{{idle_timeout_in_minutes}}}{{/idle_timeout_in_minutes}}
  {{#ip_tags}}ip_tags                 = {{{ip_tags}}}{{/ip_tags}}
  {{#ip_version}}ip_version              = {{{ip_version}}}{{/ip_version}}
  {{#lock}}lock                    = {{{lock}}}{{/lock}}
  {{#public_ip_prefix_id}}public_ip_prefix_id     = {{{public_ip_prefix_id}}}{{/public_ip_prefix_id}}
  {{#reverse_fqdn}}reverse_fqdn            = {{{reverse_fqdn}}}{{/reverse_fqdn}}
  {{#role_assignments}}role_assignments        = {{{role_assignments}}}{{/role_assignments}}
  {{#sku}}sku                     = {{{sku}}}{{/sku}}
  {{#sku_tier}}sku_tier                = {{{sku_tier}}}{{/sku_tier}}
  {{#tags}}tags                    = {{{tags}}}{{/tags}}
  {{#zones}}zones                   = {{{zones}}}{{/zones}}
}
