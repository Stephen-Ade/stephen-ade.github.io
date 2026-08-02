terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_botservice_botservice" {
  source  = "Azure/avm-res-botservice-botservice/azurerm"
  version = "0.4.0"

  {{#if location}}location                                  = {{hclVal location}}{{/if}}
  {{#if microsoft_app_id}}microsoft_app_id                          = {{hclVal microsoft_app_id}}{{/if}}
  {{#if name}}name                                      = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                       = {{hclVal resource_group_name}}{{/if}}
  {{#if all_settings}}all_settings                              = {{hclVal all_settings}}{{/if}}
  {{#if app_password_hint}}app_password_hint                         = {{hclVal app_password_hint}}{{/if}}
  {{#if channels}}channels                                  = {{hclVal channels}}{{/if}}
  {{#if cmek_key_vault_url}}cmek_key_vault_url                        = {{hclVal cmek_key_vault_url}}{{/if}}
  {{#if connections}}connections                               = {{hclVal connections}}{{/if}}
  {{#if description}}description                               = {{hclVal description}}{{/if}}
  {{#if developer_app_insights_api_key}}developer_app_insights_api_key            = {{hclVal developer_app_insights_api_key}}{{/if}}
  {{#if developer_app_insights_application_id}}developer_app_insights_application_id     = {{hclVal developer_app_insights_application_id}}{{/if}}
  {{#if developer_app_insights_key}}developer_app_insights_key                = {{hclVal developer_app_insights_key}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                       = {{hclVal diagnostic_settings}}{{/if}}
  {{#if display_name}}display_name                              = {{hclVal display_name}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                          = {{hclVal enable_telemetry}}{{/if}}
  {{#if endpoint}}endpoint                                  = {{hclVal endpoint}}{{/if}}
  {{#if etag}}etag                                      = {{hclVal etag}}{{/if}}
  {{#if icon_url}}icon_url                                  = {{hclVal icon_url}}{{/if}}
  {{#if is_cmek_enabled}}is_cmek_enabled                           = {{hclVal is_cmek_enabled}}{{/if}}
  {{#if kind}}kind                                      = {{hclVal kind}}{{/if}}
  {{#if local_authentication_enabled}}local_authentication_enabled              = {{hclVal local_authentication_enabled}}{{/if}}
  {{#if lock}}lock                                      = {{hclVal lock}}{{/if}}
  {{#if luis_app_ids}}luis_app_ids                              = {{hclVal luis_app_ids}}{{/if}}
  {{#if luis_key}}luis_key                                  = {{hclVal luis_key}}{{/if}}
  {{#if manifest_url}}manifest_url                              = {{hclVal manifest_url}}{{/if}}
  {{#if microsoft_app_msi_id}}microsoft_app_msi_id                      = {{hclVal microsoft_app_msi_id}}{{/if}}
  {{#if microsoft_app_tenant_id}}microsoft_app_tenant_id                   = {{hclVal microsoft_app_tenant_id}}{{/if}}
  {{#if microsoft_app_type}}microsoft_app_type                        = {{hclVal microsoft_app_type}}{{/if}}
  {{#if network_security_perimeter_configurations}}network_security_perimeter_configurations = {{hclVal network_security_perimeter_configurations}}{{/if}}
  {{#if open_with_hint}}open_with_hint                            = {{hclVal open_with_hint}}{{/if}}
  {{#if parameters}}parameters                                = {{hclVal parameters}}{{/if}}
  {{#if private_endpoint_connections}}private_endpoint_connections              = {{hclVal private_endpoint_connections}}{{/if}}
  {{#if private_endpoints}}private_endpoints                         = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group   = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if public_network_access}}public_network_access                     = {{hclVal public_network_access}}{{/if}}
  {{#if public_network_access_enabled}}public_network_access_enabled             = {{hclVal public_network_access_enabled}}{{/if}}
  {{#if publishing_credentials}}publishing_credentials                    = {{hclVal publishing_credentials}}{{/if}}
  {{#if role_assignments}}role_assignments                          = {{hclVal role_assignments}}{{/if}}
  {{#if schema_transformation_version}}schema_transformation_version             = {{hclVal schema_transformation_version}}{{/if}}
  {{#if schema_validation_enabled}}schema_validation_enabled                 = {{hclVal schema_validation_enabled}}{{/if}}
  {{#if sku}}sku                                       = {{hclVal sku}}{{/if}}
  {{#if storage_resource_id}}storage_resource_id                       = {{hclVal storage_resource_id}}{{/if}}
  {{#if streaming_endpoint_enabled}}streaming_endpoint_enabled                = {{hclVal streaming_endpoint_enabled}}{{/if}}
  {{#if tags}}tags                                      = {{hclVal tags}}{{/if}}
  {{#if tenant_id}}tenant_id                                 = {{hclVal tenant_id}}{{/if}}
  {{#if timeouts}}timeouts                                  = {{hclVal timeouts}}{{/if}}
}
