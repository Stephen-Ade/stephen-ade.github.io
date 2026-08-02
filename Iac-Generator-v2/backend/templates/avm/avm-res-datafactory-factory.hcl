terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-datafactory-factory" {
  source  = "Azure/avm-res-datafactory-factory/azurerm"
  version = "0.1.0"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#credential_service_principal}}credential_service_principal            = {{{credential_service_principal}}}{{/credential_service_principal}}
  {{#credential_user_managed_identity}}credential_user_managed_identity        = {{{credential_user_managed_identity}}}{{/credential_user_managed_identity}}
  {{#customer_managed_key_id}}customer_managed_key_id                 = {{{customer_managed_key_id}}}{{/customer_managed_key_id}}
  {{#customer_managed_key_identity_id}}customer_managed_key_identity_id        = {{{customer_managed_key_identity_id}}}{{/customer_managed_key_identity_id}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#github_configuration}}github_configuration                    = {{{github_configuration}}}{{/github_configuration}}
  {{#global_parameters}}global_parameters                       = {{{global_parameters}}}{{/global_parameters}}
  {{#integration_runtime_self_hosted}}integration_runtime_self_hosted         = {{{integration_runtime_self_hosted}}}{{/integration_runtime_self_hosted}}
  {{#linked_service_azure_blob_storage}}linked_service_azure_blob_storage       = {{{linked_service_azure_blob_storage}}}{{/linked_service_azure_blob_storage}}
  {{#linked_service_azure_file_storage}}linked_service_azure_file_storage       = {{{linked_service_azure_file_storage}}}{{/linked_service_azure_file_storage}}
  {{#linked_service_azure_sql_database}}linked_service_azure_sql_database       = {{{linked_service_azure_sql_database}}}{{/linked_service_azure_sql_database}}
  {{#linked_service_data_lake_storage_gen2}}linked_service_data_lake_storage_gen2   = {{{linked_service_data_lake_storage_gen2}}}{{/linked_service_data_lake_storage_gen2}}
  {{#linked_service_databricks}}linked_service_databricks               = {{{linked_service_databricks}}}{{/linked_service_databricks}}
  {{#linked_service_key_vault}}linked_service_key_vault                = {{{linked_service_key_vault}}}{{/linked_service_key_vault}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#managed_virtual_network_enabled}}managed_virtual_network_enabled         = {{{managed_virtual_network_enabled}}}{{/managed_virtual_network_enabled}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_enabled}}public_network_enabled                  = {{{public_network_enabled}}}{{/public_network_enabled}}
  {{#purview_id}}purview_id                              = {{{purview_id}}}{{/purview_id}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#vsts_configuration}}vsts_configuration                      = {{{vsts_configuration}}}{{/vsts_configuration}}
}
