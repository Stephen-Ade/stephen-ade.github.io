terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_edge_site" {
  source  = "Azure/avm-res-edge-site/azurerm"
  version = "3.0.0"

  {{#if country}}country            = {{hclVal country}}{{/if}}
  {{#if resource_group_id}}resource_group_id  = {{hclVal resource_group_id}}{{/if}}
  {{#if site_display_name}}site_display_name  = {{hclVal site_display_name}}{{/if}}
  {{#if site_resource_name}}site_resource_name = {{hclVal site_resource_name}}{{/if}}
  {{#if city}}city               = {{hclVal city}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry   = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock               = {{hclVal lock}}{{/if}}
  {{#if postal_code}}postal_code        = {{hclVal postal_code}}{{/if}}
  {{#if role_assignments}}role_assignments   = {{hclVal role_assignments}}{{/if}}
  {{#if site_description}}site_description   = {{hclVal site_description}}{{/if}}
  {{#if site_labels}}site_labels        = {{hclVal site_labels}}{{/if}}
  {{#if state_or_province}}state_or_province  = {{hclVal state_or_province}}{{/if}}
  {{#if street_address_1}}street_address_1   = {{hclVal street_address_1}}{{/if}}
  {{#if street_address_2}}street_address_2   = {{hclVal street_address_2}}{{/if}}
  {{#if tags}}tags               = {{hclVal tags}}{{/if}}
}
