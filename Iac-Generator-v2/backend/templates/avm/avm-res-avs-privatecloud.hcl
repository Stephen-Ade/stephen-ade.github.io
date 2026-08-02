terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-avs-privatecloud" {
  source  = "Azure/avm-res-avs-privatecloud/azurerm"
  version = "0.12.0"

  {{#if avs_network_cidr}}avs_network_cidr                     = {{hclVal avs_network_cidr}}{{/if}}
  {{#if location}}location                             = {{hclVal location}}{{/if}}
  {{#if name}}name                                 = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                  = {{hclVal resource_group_name}}{{/if}}
  {{#if resource_group_resource_id}}resource_group_resource_id           = {{hclVal resource_group_resource_id}}{{/if}}
  {{#if sku_name}}sku_name                             = {{hclVal sku_name}}{{/if}}
  {{#if addons}}addons                               = {{hclVal addons}}{{/if}}
  {{#if avs_interconnect_connections}}avs_interconnect_connections         = {{hclVal avs_interconnect_connections}}{{/if}}
  {{#if clusters}}clusters                             = {{hclVal clusters}}{{/if}}
  {{#if default_dns_ips}}default_dns_ips                      = {{hclVal default_dns_ips}}{{/if}}
  {{#if dhcp_configuration}}dhcp_configuration                   = {{hclVal dhcp_configuration}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                  = {{hclVal diagnostic_settings}}{{/if}}
  {{#if dns_forwarder_zones}}dns_forwarder_zones                  = {{hclVal dns_forwarder_zones}}{{/if}}
  {{#if dns_zone_type}}dns_zone_type                        = {{hclVal dns_zone_type}}{{/if}}
  {{#if elastic_san_datastores}}elastic_san_datastores               = {{hclVal elastic_san_datastores}}{{/if}}
  {{#if enable_stretch_cluster}}enable_stretch_cluster               = {{hclVal enable_stretch_cluster}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                     = {{hclVal enable_telemetry}}{{/if}}
  {{#if expressroute_connections}}expressroute_connections             = {{hclVal expressroute_connections}}{{/if}}
  {{#if extended_network_blocks}}extended_network_blocks              = {{hclVal extended_network_blocks}}{{/if}}
  {{#if external_storage_address_block}}external_storage_address_block       = {{hclVal external_storage_address_block}}{{/if}}
  {{#if gen2_subnets_user_defined_routes}}gen2_subnets_user_defined_routes     = {{hclVal gen2_subnets_user_defined_routes}}{{/if}}
  {{#if global_reach_connections}}global_reach_connections             = {{hclVal global_reach_connections}}{{/if}}
  {{#if internet_enabled}}internet_enabled                     = {{hclVal internet_enabled}}{{/if}}
  {{#if internet_inbound_public_ips}}internet_inbound_public_ips          = {{hclVal internet_inbound_public_ips}}{{/if}}
  {{#if lock}}lock                                 = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                   = {{hclVal managed_identities}}{{/if}}
  {{#if management_cluster_size}}management_cluster_size              = {{hclVal management_cluster_size}}{{/if}}
  {{#if netapp_files_datastores}}netapp_files_datastores              = {{hclVal netapp_files_datastores}}{{/if}}
  {{#if nsxt_password}}nsxt_password                        = {{hclVal nsxt_password}}{{/if}}
  {{#if primary_zone}}primary_zone                         = {{hclVal primary_zone}}{{/if}}
  {{#if role_assignments}}role_assignments                     = {{hclVal role_assignments}}{{/if}}
  {{#if secondary_zone}}secondary_zone                       = {{hclVal secondary_zone}}{{/if}}
  {{#if segments}}segments                             = {{hclVal segments}}{{/if}}
  {{#if tags}}tags                                 = {{hclVal tags}}{{/if}}
  {{#if vcenter_identity_sources}}vcenter_identity_sources             = {{hclVal vcenter_identity_sources}}{{/if}}
  {{#if vcenter_identity_sources_credentials}}vcenter_identity_sources_credentials = {{hclVal vcenter_identity_sources_credentials}}{{/if}}
  {{#if vcenter_password}}vcenter_password                     = {{hclVal vcenter_password}}{{/if}}
  {{#if vcf_license}}vcf_license                          = {{hclVal vcf_license}}{{/if}}
  {{#if virtual_network_resource_id}}virtual_network_resource_id          = {{hclVal virtual_network_resource_id}}{{/if}}
}
