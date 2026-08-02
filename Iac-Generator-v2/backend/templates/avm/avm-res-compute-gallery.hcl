terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_compute_gallery" {
  source  = "Azure/avm-res-compute-gallery/azurerm"
  version = "0.2.1"

  {{#if location}}location                 = {{hclVal location}}{{/if}}
  {{#if name}}name                     = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name      = {{hclVal resource_group_name}}{{/if}}
  {{#if description}}description              = {{hclVal description}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry         = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                     = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments         = {{hclVal role_assignments}}{{/if}}
  {{#if shared_image_definitions}}shared_image_definitions = {{hclVal shared_image_definitions}}{{/if}}
  {{#if sharing}}sharing                  = {{hclVal sharing}}{{/if}}
  {{#if tags}}tags                     = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                 = {{hclVal timeouts}}{{/if}}
}
