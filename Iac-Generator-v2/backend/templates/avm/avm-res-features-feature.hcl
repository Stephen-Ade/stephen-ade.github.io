terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-features-feature" {
  source  = "Azure/avm-res-features-feature/azurerm"
  version = "0.1.0"

  {{#if name}}name                            = {{hclVal name}}{{/if}}
  {{#if provider_name}}provider_name                   = {{hclVal provider_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                = {{hclVal enable_telemetry}}{{/if}}
  {{#if feature_registration_timeouts}}feature_registration_timeouts   = {{hclVal feature_registration_timeouts}}{{/if}}
  {{#if feature_unregistration_timeouts}}feature_unregistration_timeouts = {{hclVal feature_unregistration_timeouts}}{{/if}}
  {{#if lock}}lock                            = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments                = {{hclVal role_assignments}}{{/if}}
}
