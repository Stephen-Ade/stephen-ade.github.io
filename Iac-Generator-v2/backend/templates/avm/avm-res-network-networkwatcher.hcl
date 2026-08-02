terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_networkwatcher" {
  source  = "Azure/avm-res-network-networkwatcher/azurerm"
  version = "0.3.2"

  {{#if location}}location             = {{hclVal location}}{{/if}}
  {{#if network_watcher_id}}network_watcher_id   = {{hclVal network_watcher_id}}{{/if}}
  {{#if network_watcher_name}}network_watcher_name = {{hclVal network_watcher_name}}{{/if}}
  {{#if resource_group_name}}resource_group_name  = {{hclVal resource_group_name}}{{/if}}
  {{#if condition_monitor}}condition_monitor    = {{hclVal condition_monitor}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry     = {{hclVal enable_telemetry}}{{/if}}
  {{#if flow_logs}}flow_logs            = {{hclVal flow_logs}}{{/if}}
  {{#if lock}}lock                 = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments     = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                 = {{hclVal tags}}{{/if}}
}
