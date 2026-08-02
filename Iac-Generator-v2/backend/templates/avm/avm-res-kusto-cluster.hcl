terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-kusto-cluster" {
  source  = "Azure/avm-res-kusto-cluster/azurerm"
  version = "0.1.0"

  {{#name}}name                                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                 = {{{resource_group_name}}}{{/resource_group_name}}
  {{#sku}}sku                                 = {{{sku}}}{{/sku}}
  {{#allowed_fqdns}}allowed_fqdns                       = {{{allowed_fqdns}}}{{/allowed_fqdns}}
  {{#allowed_ip_ranges}}allowed_ip_ranges                   = {{{allowed_ip_ranges}}}{{/allowed_ip_ranges}}
  {{#auto_stop_enabled}}auto_stop_enabled                   = {{{auto_stop_enabled}}}{{/auto_stop_enabled}}
  {{#databases}}databases                           = {{{databases}}}{{/databases}}
  {{#diagnostic_settings}}diagnostic_settings                 = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#disk_encryption_enabled}}disk_encryption_enabled             = {{{disk_encryption_enabled}}}{{/disk_encryption_enabled}}
  {{#double_encryption_enabled}}double_encryption_enabled           = {{{double_encryption_enabled}}}{{/double_encryption_enabled}}
  {{#enable_telemetry}}enable_telemetry                    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#kusto_cluster_principal_assignments}}kusto_cluster_principal_assignments = {{{kusto_cluster_principal_assignments}}}{{/kusto_cluster_principal_assignments}}
  {{#kusto_database_principal_assignment}}kusto_database_principal_assignment = {{{kusto_database_principal_assignment}}}{{/kusto_database_principal_assignment}}
  {{#language_extensions}}language_extensions                 = {{{language_extensions}}}{{/language_extensions}}
  {{#location}}location                            = {{{location}}}{{/location}}
  {{#lock}}lock                                = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                  = {{{managed_identities}}}{{/managed_identities}}
  {{#optimized_auto_scale}}optimized_auto_scale                = {{{optimized_auto_scale}}}{{/optimized_auto_scale}}
  {{#outbound_network_access_restricted}}outbound_network_access_restricted  = {{{outbound_network_access_restricted}}}{{/outbound_network_access_restricted}}
  {{#private_endpoints}}private_endpoints                   = {{{private_endpoints}}}{{/private_endpoints}}
  {{#public_ip_type}}public_ip_type                      = {{{public_ip_type}}}{{/public_ip_type}}
  {{#public_network_access_enabled}}public_network_access_enabled       = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#purge_enabled}}purge_enabled                       = {{{purge_enabled}}}{{/purge_enabled}}
  {{#role_assignments}}role_assignments                    = {{{role_assignments}}}{{/role_assignments}}
  {{#streaming_ingestion_enabled}}streaming_ingestion_enabled         = {{{streaming_ingestion_enabled}}}{{/streaming_ingestion_enabled}}
  {{#tags}}tags                                = {{{tags}}}{{/tags}}
  {{#trusted_external_tenants}}trusted_external_tenants            = {{{trusted_external_tenants}}}{{/trusted_external_tenants}}
  {{#virtual_network_configuration}}virtual_network_configuration       = {{{virtual_network_configuration}}}{{/virtual_network_configuration}}
  {{#zones}}zones                               = {{{zones}}}{{/zones}}
}
