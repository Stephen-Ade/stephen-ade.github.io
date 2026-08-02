terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-applicationsecuritygroup" {
  source  = "Azure/avm-res-network-applicationsecuritygroup/azurerm"
  version = "0.1.1"

  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments    = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
}
