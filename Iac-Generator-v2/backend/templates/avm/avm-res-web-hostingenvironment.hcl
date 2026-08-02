terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-web-hostingenvironment" {
  source  = "Azure/avm-res-web-hostingenvironment/azurerm"
  version = "2.0.1"

  {{#if location}}location                               = {{hclVal location}}{{/if}}
  {{#if name}}name                                   = {{hclVal name}}{{/if}}
  {{#if parent_id}}parent_id                              = {{hclVal parent_id}}{{/if}}
  {{#if subnet_id}}subnet_id                              = {{hclVal subnet_id}}{{/if}}
  {{#if allow_new_private_endpoint_connections}}allow_new_private_endpoint_connections = {{hclVal allow_new_private_endpoint_connections}}{{/if}}
  {{#if cluster_settings}}cluster_settings                       = {{hclVal cluster_settings}}{{/if}}
  {{#if custom_dns_suffix_configuration}}custom_dns_suffix_configuration        = {{hclVal custom_dns_suffix_configuration}}{{/if}}
  {{#if dedicated_host_count}}dedicated_host_count                   = {{hclVal dedicated_host_count}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings                    = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                       = {{hclVal enable_telemetry}}{{/if}}
  {{#if fips_mode_enabled}}fips_mode_enabled                      = {{hclVal fips_mode_enabled}}{{/if}}
  {{#if front_end_tls_cipher_suite_order}}front_end_tls_cipher_suite_order       = {{hclVal front_end_tls_cipher_suite_order}}{{/if}}
  {{#if ftp_enabled}}ftp_enabled                            = {{hclVal ftp_enabled}}{{/if}}
  {{#if inbound_ip_address_override}}inbound_ip_address_override            = {{hclVal inbound_ip_address_override}}{{/if}}
  {{#if internal_encryption_enabled}}internal_encryption_enabled            = {{hclVal internal_encryption_enabled}}{{/if}}
  {{#if internal_load_balancing_mode}}internal_load_balancing_mode           = {{hclVal internal_load_balancing_mode}}{{/if}}
  {{#if lock}}lock                                   = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities                     = {{hclVal managed_identities}}{{/if}}
  {{#if remote_debug_enabled}}remote_debug_enabled                   = {{hclVal remote_debug_enabled}}{{/if}}
  {{#if retry}}retry                                  = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments                       = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                   = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                               = {{hclVal timeouts}}{{/if}}
  {{#if tls_1_enabled}}tls_1_enabled                          = {{hclVal tls_1_enabled}}{{/if}}
  {{#if upgrade_preference}}upgrade_preference                     = {{hclVal upgrade_preference}}{{/if}}
  {{#if zone_redundancy_enabled}}zone_redundancy_enabled                = {{hclVal zone_redundancy_enabled}}{{/if}}
}
