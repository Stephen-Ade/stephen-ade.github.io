terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_management_servicegroup" {
  source  = "Azure/avm-res-management-servicegroup/azurerm"
  version = "0.1.0"

  {{#if name}}name                    = {{hclVal name}}{{/if}}
  {{#if display_name}}display_name            = {{hclVal display_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry        = {{hclVal enable_telemetry}}{{/if}}
  {{#if parent_service_group_id}}parent_service_group_id = {{hclVal parent_service_group_id}}{{/if}}
  {{#if role_assignments}}role_assignments        = {{hclVal role_assignments}}{{/if}}
  {{#if service_group_members}}service_group_members   = {{hclVal service_group_members}}{{/if}}
}
