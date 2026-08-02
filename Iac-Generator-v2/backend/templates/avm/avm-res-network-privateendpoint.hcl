terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_privateendpoint" {
  source  = "Azure/avm-res-network-privateendpoint/azurerm"
  version = "0.2.0"

  {{#if location}}location                                   = {{hclVal location}}{{/if}}
  {{#if name}}name                                       = {{hclVal name}}{{/if}}
  {{#if network_interface_name}}network_interface_name                     = {{hclVal network_interface_name}}{{/if}}
  {{#if private_connection_resource_id}}private_connection_resource_id             = {{hclVal private_connection_resource_id}}{{/if}}
  {{#if resource_group_name}}resource_group_name                        = {{hclVal resource_group_name}}{{/if}}
  {{#if subnet_resource_id}}subnet_resource_id                         = {{hclVal subnet_resource_id}}{{/if}}
  {{#if application_security_group_association_ids}}application_security_group_association_ids = {{hclVal application_security_group_association_ids}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                           = {{hclVal enable_telemetry}}{{/if}}
  {{#if ip_configurations}}ip_configurations                          = {{hclVal ip_configurations}}{{/if}}
  {{#if lock}}lock                                       = {{hclVal lock}}{{/if}}
  {{#if private_dns_zone_group_name}}private_dns_zone_group_name                = {{hclVal private_dns_zone_group_name}}{{/if}}
  {{#if private_dns_zone_resource_ids}}private_dns_zone_resource_ids              = {{hclVal private_dns_zone_resource_ids}}{{/if}}
  {{#if private_service_connection_name}}private_service_connection_name            = {{hclVal private_service_connection_name}}{{/if}}
  {{#if role_assignments}}role_assignments                           = {{hclVal role_assignments}}{{/if}}
  {{#if subresource_names}}subresource_names                          = {{hclVal subresource_names}}{{/if}}
  {{#if tags}}tags                                       = {{hclVal tags}}{{/if}}
}
