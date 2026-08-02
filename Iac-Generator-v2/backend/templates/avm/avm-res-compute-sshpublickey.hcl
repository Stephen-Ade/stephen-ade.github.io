terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_compute_sshpublickey" {
  source  = "Azure/avm-res-compute-sshpublickey/azurerm"
  version = "0.1.0"

  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if public_key}}public_key          = {{hclVal public_key}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if lock}}lock                = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities  = {{hclVal managed_identities}}{{/if}}
  {{#if role_assignments}}role_assignments    = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
}
