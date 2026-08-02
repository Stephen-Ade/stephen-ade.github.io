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

  {{#name}}name                            = {{{name}}}{{/name}}
  {{#provider_name}}provider_name                   = {{{provider_name}}}{{/provider_name}}
  {{#enable_telemetry}}enable_telemetry                = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#feature_registration_timeouts}}feature_registration_timeouts   = {{{feature_registration_timeouts}}}{{/feature_registration_timeouts}}
  {{#feature_unregistration_timeouts}}feature_unregistration_timeouts = {{{feature_unregistration_timeouts}}}{{/feature_unregistration_timeouts}}
  {{#lock}}lock                            = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments                = {{{role_assignments}}}{{/role_assignments}}
}
