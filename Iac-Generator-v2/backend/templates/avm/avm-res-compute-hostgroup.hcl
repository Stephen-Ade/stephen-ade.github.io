terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-hostgroup" {
  source  = "Azure/avm-res-compute-hostgroup/azurerm"
  version = "0.1.3"

  {{#dedicated_host_group_name}}dedicated_host_group_name   = {{{dedicated_host_group_name}}}{{/dedicated_host_group_name}}
  {{#location}}location                    = {{{location}}}{{/location}}
  {{#platform_fault_domain_count}}platform_fault_domain_count = {{{platform_fault_domain_count}}}{{/platform_fault_domain_count}}
  {{#resource_group_name}}resource_group_name         = {{{resource_group_name}}}{{/resource_group_name}}
  {{#automatic_placement_enabled}}automatic_placement_enabled = {{{automatic_placement_enabled}}}{{/automatic_placement_enabled}}
  {{#dedicated_hosts}}dedicated_hosts             = {{{dedicated_hosts}}}{{/dedicated_hosts}}
  {{#enable_telemetry}}enable_telemetry            = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#tags}}tags                        = {{{tags}}}{{/tags}}
  {{#zone}}zone                        = {{{zone}}}{{/zone}}
}
