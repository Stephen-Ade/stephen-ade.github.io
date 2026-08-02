terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_kusto_cluster" {
  source  = "Azure/avm-res-kusto-cluster/azurerm"
  version = "0.1.0"

  {{#if name}}name                                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                 = {{hclVal resource_group_name}}{{/if}}
  {{#if sku}}sku                                 = {{hclVal sku}}{{/if}}
  {{#if allowed_fqdns}}allowed_fqdns                       = {{hclVal allowed_fqdns}}{{/if}}
  {{#if allowed_ip_ranges}}allowed_ip_ranges                   = {{hclVal allowed_ip_ranges}}{{/if}}
  {{#if auto_stop_enabled}}auto_stop_enabled                   = {{hclVal auto_stop_enabled}}{{/if}}
  {{#if databases}}databases                           = {{hclVal databases}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                 = {{hclVal diagnostic_settings}}{{/if}}
  {{#if disk_encryption_enabled}}disk_encryption_enabled             = {{hclVal disk_encryption_enabled}}{{/if}}
  {{#if double_encryption_enabled}}double_encryption_enabled           = {{hclVal double_encryption_enabled}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                    = {{hclVal enable_telemetry}}{{/if}}
  {{#if kusto_cluster_principal_assignments}}kusto_cluster_principal_assignments = {{hclVal kusto_cluster_principal_assignments}}{{/if}}
  {{#if kusto_database_principal_assignment}}kusto_database_principal_assignment = {{hclVal kusto_database_principal_assignment}}{{/if}}
  {{#if language_extensions}}language_extensions                 = {{hclVal language_extensions}}{{/if}}
  {{#if location}}location                            = {{hclVal location}}{{/if}}
  {{#if lock}}lock                                = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                  = {{hclVal managed_identities}}{{/if}}
  {{#if optimized_auto_scale}}optimized_auto_scale                = {{hclVal optimized_auto_scale}}{{/if}}
  {{#if outbound_network_access_restricted}}outbound_network_access_restricted  = {{hclVal outbound_network_access_restricted}}{{/if}}
  {{#if private_endpoints}}private_endpoints                   = {{hclVal private_endpoints}}{{/if}}
  {{#if public_ip_type}}public_ip_type                      = {{hclVal public_ip_type}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled       = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if purge_enabled}}purge_enabled                       = {{hclVal purge_enabled}}{{/if}}
  {{#if role_assignments}}role_assignments                    = {{hclVal role_assignments}}{{/if}}
  {{#if streaming_ingestion_enabled}}streaming_ingestion_enabled         = {{hclVal streaming_ingestion_enabled}}{{/if}}
  {{#if tags}}tags                                = {{hclVal tags}}{{/if}}
  {{#if trusted_external_tenants}}trusted_external_tenants            = {{hclVal trusted_external_tenants}}{{/if}}
  {{#if virtual_network_configuration}}virtual_network_configuration       = {{hclVal virtual_network_configuration}}{{/if}}
  {{#if zones}}zones                               = {{hclVal zones}}{{/if}}
}
