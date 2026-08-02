terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_compute_hostgroup" {
  source  = "Azure/avm-res-compute-hostgroup/azurerm"
  version = "0.1.3"

  {{#if dedicated_host_group_name}}dedicated_host_group_name   = {{hclVal dedicated_host_group_name}}{{/if}}
  {{#if location}}location                    = {{hclVal location}}{{/if}}
  {{#if platform_fault_domain_count}}platform_fault_domain_count = {{hclVal platform_fault_domain_count}}{{/if}}
  {{#if resource_group_name}}resource_group_name         = {{hclVal resource_group_name}}{{/if}}
  {{#if automatic_placement_enabled}}automatic_placement_enabled = {{hclVal automatic_placement_enabled}}{{/if}}
  {{#if dedicated_hosts}}dedicated_hosts             = {{hclVal dedicated_hosts}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry            = {{hclVal enable_telemetry}}{{/if}}
  {{#if tags}}tags                        = {{hclVal tags}}{{/if}}
  {{#if zone}}zone                        = {{hclVal zone}}{{/if}}
}
