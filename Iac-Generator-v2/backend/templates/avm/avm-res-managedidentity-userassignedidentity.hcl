terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-managedidentity-userassignedidentity" {
  source  = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
  version = "0.5.1"

  {{#if location}}location                       = {{hclVal location}}{{/if}}
  {{#if name}}name                           = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name            = {{hclVal resource_group_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry               = {{hclVal enable_telemetry}}{{/if}}
  {{#if federated_identity_credentials}}federated_identity_credentials = {{hclVal federated_identity_credentials}}{{/if}}
  {{#if lock}}lock                           = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments               = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                           = {{hclVal tags}}{{/if}}
}
