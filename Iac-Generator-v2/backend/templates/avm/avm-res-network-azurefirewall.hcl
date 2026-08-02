terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-azurefirewall" {
  source  = "Azure/avm-res-network-azurefirewall/azurerm"
  version = "0.4.0"

  {{#firewall_sku_name}}firewall_sku_name                    = {{{firewall_sku_name}}}{{/firewall_sku_name}}
  {{#firewall_sku_tier}}firewall_sku_tier                    = {{{firewall_sku_tier}}}{{/firewall_sku_tier}}
  {{#location}}location                             = {{{location}}}{{/location}}
  {{#name}}name                                 = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                  = {{{resource_group_name}}}{{/resource_group_name}}
  {{#diagnostic_settings}}diagnostic_settings                  = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#firewall_ip_configuration}}firewall_ip_configuration            = {{{firewall_ip_configuration}}}{{/firewall_ip_configuration}}
  {{#firewall_management_ip_configuration}}firewall_management_ip_configuration = {{{firewall_management_ip_configuration}}}{{/firewall_management_ip_configuration}}
  {{#firewall_policy_id}}firewall_policy_id                   = {{{firewall_policy_id}}}{{/firewall_policy_id}}
  {{#firewall_private_ip_ranges}}firewall_private_ip_ranges           = {{{firewall_private_ip_ranges}}}{{/firewall_private_ip_ranges}}
  {{#firewall_timeouts}}firewall_timeouts                    = {{{firewall_timeouts}}}{{/firewall_timeouts}}
  {{#firewall_virtual_hub}}firewall_virtual_hub                 = {{{firewall_virtual_hub}}}{{/firewall_virtual_hub}}
  {{#firewall_zones}}firewall_zones                       = {{{firewall_zones}}}{{/firewall_zones}}
  {{#ip_configurations}}ip_configurations                    = {{{ip_configurations}}}{{/ip_configurations}}
  {{#lock}}lock                                 = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments                     = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                 = {{{tags}}}{{/tags}}
}
