terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-insights-autoscalesetting" {
  source  = "Azure/avm-res-insights-autoscalesetting/azurerm"
  version = "0.1.2"

  {{#if location}}location            = {{hclVal location}}{{/if}}
  {{#if name}}name                = {{hclVal name}}{{/if}}
  {{#if profiles}}profiles            = {{hclVal profiles}}{{/if}}
  {{#if resource_group_name}}resource_group_name = {{hclVal resource_group_name}}{{/if}}
  {{#if target_resource_id}}target_resource_id  = {{hclVal target_resource_id}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry    = {{hclVal enable_telemetry}}{{/if}}
  {{#if enabled}}enabled             = {{hclVal enabled}}{{/if}}
  {{#if notification}}notification        = {{hclVal notification}}{{/if}}
  {{#if predictive}}predictive          = {{hclVal predictive}}{{/if}}
  {{#if tags}}tags                = {{hclVal tags}}{{/if}}
}
