terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_datafactory_factory" {
  source  = "Azure/avm-res-datafactory-factory/azurerm"
  version = "0.1.0"

  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if credential_service_principal}}credential_service_principal            = {{hclVal credential_service_principal}}{{/if}}
  {{#if credential_user_managed_identity}}credential_user_managed_identity        = {{hclVal credential_user_managed_identity}}{{/if}}
  {{#if customer_managed_key_id}}customer_managed_key_id                 = {{hclVal customer_managed_key_id}}{{/if}}
  {{#if customer_managed_key_identity_id}}customer_managed_key_identity_id        = {{hclVal customer_managed_key_identity_id}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                     = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if github_configuration}}github_configuration                    = {{hclVal github_configuration}}{{/if}}
  {{#if global_parameters}}global_parameters                       = {{hclVal global_parameters}}{{/if}}
  {{#if integration_runtime_self_hosted}}integration_runtime_self_hosted         = {{hclVal integration_runtime_self_hosted}}{{/if}}
  {{#if linked_service_azure_blob_storage}}linked_service_azure_blob_storage       = {{hclVal linked_service_azure_blob_storage}}{{/if}}
  {{#if linked_service_azure_file_storage}}linked_service_azure_file_storage       = {{hclVal linked_service_azure_file_storage}}{{/if}}
  {{#if linked_service_azure_sql_database}}linked_service_azure_sql_database       = {{hclVal linked_service_azure_sql_database}}{{/if}}
  {{#if linked_service_data_lake_storage_gen2}}linked_service_data_lake_storage_gen2   = {{hclVal linked_service_data_lake_storage_gen2}}{{/if}}
  {{#if linked_service_databricks}}linked_service_databricks               = {{hclVal linked_service_databricks}}{{/if}}
  {{#if linked_service_key_vault}}linked_service_key_vault                = {{hclVal linked_service_key_vault}}{{/if}}
  {{#if lock}}lock                                    = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if managed_virtual_network_enabled}}managed_virtual_network_enabled         = {{hclVal managed_virtual_network_enabled}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_enabled}}public_network_enabled                  = {{hclVal public_network_enabled}}{{/if}}
  {{#if purview_id}}purview_id                              = {{hclVal purview_id}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if vsts_configuration}}vsts_configuration                      = {{hclVal vsts_configuration}}{{/if}}
}
