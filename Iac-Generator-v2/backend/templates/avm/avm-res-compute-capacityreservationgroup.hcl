terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_compute_capacityreservationgroup" {
  source  = "Azure/avm-res-compute-capacityreservationgroup/azurerm"
  version = "0.1.0"

  {{#if capacity_reservation_group_name}}capacity_reservation_group_name         = {{hclVal capacity_reservation_group_name}}{{/if}}
  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if resource_group_id}}resource_group_id                       = {{hclVal resource_group_id}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if schema_validation_enabled}}schema_validation_enabled               = {{hclVal schema_validation_enabled}}{{/if}}
  {{#if sharing_profile}}sharing_profile                         = {{hclVal sharing_profile}}{{/if}}
  {{#if subscription_id}}subscription_id                         = {{hclVal subscription_id}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if zones}}zones                                   = {{hclVal zones}}{{/if}}
}
