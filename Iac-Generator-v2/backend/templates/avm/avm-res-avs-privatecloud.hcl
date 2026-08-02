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

  {{#avs_network_cidr}}avs_network_cidr                     = {{{avs_network_cidr}}}{{/avs_network_cidr}}
  {{#location}}location                             = {{{location}}}{{/location}}
  {{#name}}name                                 = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                  = {{{resource_group_name}}}{{/resource_group_name}}
  {{#resource_group_resource_id}}resource_group_resource_id           = {{{resource_group_resource_id}}}{{/resource_group_resource_id}}
  {{#sku_name}}sku_name                             = {{{sku_name}}}{{/sku_name}}
  {{#addons}}addons                               = {{{addons}}}{{/addons}}
  {{#avs_interconnect_connections}}avs_interconnect_connections         = {{{avs_interconnect_connections}}}{{/avs_interconnect_connections}}
  {{#clusters}}clusters                             = {{{clusters}}}{{/clusters}}
  {{#default_dns_ips}}default_dns_ips                      = {{{default_dns_ips}}}{{/default_dns_ips}}
  {{#dhcp_configuration}}dhcp_configuration                   = {{{dhcp_configuration}}}{{/dhcp_configuration}}
  {{#diagnostic_settings}}diagnostic_settings                  = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#dns_forwarder_zones}}dns_forwarder_zones                  = {{{dns_forwarder_zones}}}{{/dns_forwarder_zones}}
  {{#dns_zone_type}}dns_zone_type                        = {{{dns_zone_type}}}{{/dns_zone_type}}
  {{#elastic_san_datastores}}elastic_san_datastores               = {{{elastic_san_datastores}}}{{/elastic_san_datastores}}
  {{#enable_stretch_cluster}}enable_stretch_cluster               = {{{enable_stretch_cluster}}}{{/enable_stretch_cluster}}
  {{#enable_telemetry}}enable_telemetry                     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#expressroute_connections}}expressroute_connections             = {{{expressroute_connections}}}{{/expressroute_connections}}
  {{#extended_network_blocks}}extended_network_blocks              = {{{extended_network_blocks}}}{{/extended_network_blocks}}
  {{#external_storage_address_block}}external_storage_address_block       = {{{external_storage_address_block}}}{{/external_storage_address_block}}
  {{#gen2_subnets_user_defined_routes}}gen2_subnets_user_defined_routes     = {{{gen2_subnets_user_defined_routes}}}{{/gen2_subnets_user_defined_routes}}
  {{#global_reach_connections}}global_reach_connections             = {{{global_reach_connections}}}{{/global_reach_connections}}
  {{#internet_enabled}}internet_enabled                     = {{{internet_enabled}}}{{/internet_enabled}}
  {{#internet_inbound_public_ips}}internet_inbound_public_ips          = {{{internet_inbound_public_ips}}}{{/internet_inbound_public_ips}}
  {{#lock}}lock                                 = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                   = {{{managed_identities}}}{{/managed_identities}}
  {{#management_cluster_size}}management_cluster_size              = {{{management_cluster_size}}}{{/management_cluster_size}}
  {{#netapp_files_datastores}}netapp_files_datastores              = {{{netapp_files_datastores}}}{{/netapp_files_datastores}}
  {{#nsxt_password}}nsxt_password                        = {{{nsxt_password}}}{{/nsxt_password}}
  {{#primary_zone}}primary_zone                         = {{{primary_zone}}}{{/primary_zone}}
  {{#role_assignments}}role_assignments                     = {{{role_assignments}}}{{/role_assignments}}
  {{#secondary_zone}}secondary_zone                       = {{{secondary_zone}}}{{/secondary_zone}}
  {{#segments}}segments                             = {{{segments}}}{{/segments}}
  {{#tags}}tags                                 = {{{tags}}}{{/tags}}
  {{#vcenter_identity_sources}}vcenter_identity_sources             = {{{vcenter_identity_sources}}}{{/vcenter_identity_sources}}
  {{#vcenter_identity_sources_credentials}}vcenter_identity_sources_credentials = {{{vcenter_identity_sources_credentials}}}{{/vcenter_identity_sources_credentials}}
  {{#vcenter_password}}vcenter_password                     = {{{vcenter_password}}}{{/vcenter_password}}
  {{#vcf_license}}vcf_license                          = {{{vcf_license}}}{{/vcf_license}}
  {{#virtual_network_resource_id}}virtual_network_resource_id          = {{{virtual_network_resource_id}}}{{/virtual_network_resource_id}}
}
