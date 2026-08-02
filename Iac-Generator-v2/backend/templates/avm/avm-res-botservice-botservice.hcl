terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-botservice-botservice" {
  source  = "Azure/avm-res-botservice-botservice/azurerm"
  version = "0.4.0"

  {{#location}}location                                  = {{{location}}}{{/location}}
  {{#microsoft_app_id}}microsoft_app_id                          = {{{microsoft_app_id}}}{{/microsoft_app_id}}
  {{#name}}name                                      = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                       = {{{resource_group_name}}}{{/resource_group_name}}
  {{#all_settings}}all_settings                              = {{{all_settings}}}{{/all_settings}}
  {{#app_password_hint}}app_password_hint                         = {{{app_password_hint}}}{{/app_password_hint}}
  {{#channels}}channels                                  = {{{channels}}}{{/channels}}
  {{#cmek_key_vault_url}}cmek_key_vault_url                        = {{{cmek_key_vault_url}}}{{/cmek_key_vault_url}}
  {{#connections}}connections                               = {{{connections}}}{{/connections}}
  {{#description}}description                               = {{{description}}}{{/description}}
  {{#developer_app_insights_api_key}}developer_app_insights_api_key            = {{{developer_app_insights_api_key}}}{{/developer_app_insights_api_key}}
  {{#developer_app_insights_application_id}}developer_app_insights_application_id     = {{{developer_app_insights_application_id}}}{{/developer_app_insights_application_id}}
  {{#developer_app_insights_key}}developer_app_insights_key                = {{{developer_app_insights_key}}}{{/developer_app_insights_key}}
  {{#diagnostic_settings}}diagnostic_settings                       = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#display_name}}display_name                              = {{{display_name}}}{{/display_name}}
  {{#enable_telemetry}}enable_telemetry                          = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#endpoint}}endpoint                                  = {{{endpoint}}}{{/endpoint}}
  {{#etag}}etag                                      = {{{etag}}}{{/etag}}
  {{#icon_url}}icon_url                                  = {{{icon_url}}}{{/icon_url}}
  {{#is_cmek_enabled}}is_cmek_enabled                           = {{{is_cmek_enabled}}}{{/is_cmek_enabled}}
  {{#kind}}kind                                      = {{{kind}}}{{/kind}}
  {{#local_authentication_enabled}}local_authentication_enabled              = {{{local_authentication_enabled}}}{{/local_authentication_enabled}}
  {{#lock}}lock                                      = {{{lock}}}{{/lock}}
  {{#luis_app_ids}}luis_app_ids                              = {{{luis_app_ids}}}{{/luis_app_ids}}
  {{#luis_key}}luis_key                                  = {{{luis_key}}}{{/luis_key}}
  {{#manifest_url}}manifest_url                              = {{{manifest_url}}}{{/manifest_url}}
  {{#microsoft_app_msi_id}}microsoft_app_msi_id                      = {{{microsoft_app_msi_id}}}{{/microsoft_app_msi_id}}
  {{#microsoft_app_tenant_id}}microsoft_app_tenant_id                   = {{{microsoft_app_tenant_id}}}{{/microsoft_app_tenant_id}}
  {{#microsoft_app_type}}microsoft_app_type                        = {{{microsoft_app_type}}}{{/microsoft_app_type}}
  {{#network_security_perimeter_configurations}}network_security_perimeter_configurations = {{{network_security_perimeter_configurations}}}{{/network_security_perimeter_configurations}}
  {{#open_with_hint}}open_with_hint                            = {{{open_with_hint}}}{{/open_with_hint}}
  {{#parameters}}parameters                                = {{{parameters}}}{{/parameters}}
  {{#private_endpoint_connections}}private_endpoint_connections              = {{{private_endpoint_connections}}}{{/private_endpoint_connections}}
  {{#private_endpoints}}private_endpoints                         = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group   = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#public_network_access}}public_network_access                     = {{{public_network_access}}}{{/public_network_access}}
  {{#public_network_access_enabled}}public_network_access_enabled             = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#publishing_credentials}}publishing_credentials                    = {{{publishing_credentials}}}{{/publishing_credentials}}
  {{#role_assignments}}role_assignments                          = {{{role_assignments}}}{{/role_assignments}}
  {{#schema_transformation_version}}schema_transformation_version             = {{{schema_transformation_version}}}{{/schema_transformation_version}}
  {{#schema_validation_enabled}}schema_validation_enabled                 = {{{schema_validation_enabled}}}{{/schema_validation_enabled}}
  {{#sku}}sku                                       = {{{sku}}}{{/sku}}
  {{#storage_resource_id}}storage_resource_id                       = {{{storage_resource_id}}}{{/storage_resource_id}}
  {{#streaming_endpoint_enabled}}streaming_endpoint_enabled                = {{{streaming_endpoint_enabled}}}{{/streaming_endpoint_enabled}}
  {{#tags}}tags                                      = {{{tags}}}{{/tags}}
  {{#tenant_id}}tenant_id                                 = {{{tenant_id}}}{{/tenant_id}}
  {{#timeouts}}timeouts                                  = {{{timeouts}}}{{/timeouts}}
}
