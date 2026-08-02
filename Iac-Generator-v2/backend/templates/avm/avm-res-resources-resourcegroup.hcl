terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_resources_resourcegroup" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.4.0"

  {{#if location}}location         = {{hclVal location}}{{/if}}
  {{#if name}}name             = {{hclVal name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock             = {{hclVal lock}}{{/if}}
  {{#if managed_by}}managed_by       = {{hclVal managed_by}}{{/if}}
  {{#if retry}}retry            = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags             = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts         = {{hclVal timeouts}}{{/if}}
}
