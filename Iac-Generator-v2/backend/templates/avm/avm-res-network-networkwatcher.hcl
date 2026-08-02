terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-networkwatcher" {
  source  = "Azure/avm-res-network-networkwatcher/azurerm"
  version = "0.3.2"

  {{#location}}location             = {{{location}}}{{/location}}
  {{#network_watcher_id}}network_watcher_id   = {{{network_watcher_id}}}{{/network_watcher_id}}
  {{#network_watcher_name}}network_watcher_name = {{{network_watcher_name}}}{{/network_watcher_name}}
  {{#resource_group_name}}resource_group_name  = {{{resource_group_name}}}{{/resource_group_name}}
  {{#condition_monitor}}condition_monitor    = {{{condition_monitor}}}{{/condition_monitor}}
  {{#enable_telemetry}}enable_telemetry     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#flow_logs}}flow_logs            = {{{flow_logs}}}{{/flow_logs}}
  {{#lock}}lock                 = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments     = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                 = {{{tags}}}{{/tags}}
}
