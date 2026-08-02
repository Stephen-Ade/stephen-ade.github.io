terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-proximityplacementgroup" {
  source  = "Azure/avm-res-compute-proximityplacementgroup/azurerm"
  version = "0.1.0"

  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if allowed_vm_sizes}}allowed_vm_sizes    = {{hclVal allowed_vm_sizes}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                = {{hclVal lock}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
  {{#if zone}}zone                = {{hclVal zone}}{{/if}}
}
