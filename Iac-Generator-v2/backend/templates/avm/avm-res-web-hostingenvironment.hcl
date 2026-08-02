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

  {{#location}}location                               = {{{location}}}{{/location}}
  {{#name}}name                                   = {{{name}}}{{/name}}
  {{#parent_id}}parent_id                              = {{{parent_id}}}{{/parent_id}}
  {{#subnet_id}}subnet_id                              = {{{subnet_id}}}{{/subnet_id}}
  {{#allow_new_private_endpoint_connections}}allow_new_private_endpoint_connections = {{{allow_new_private_endpoint_connections}}}{{/allow_new_private_endpoint_connections}}
  {{#cluster_settings}}cluster_settings                       = {{{cluster_settings}}}{{/cluster_settings}}
  {{#custom_dns_suffix_configuration}}custom_dns_suffix_configuration        = {{{custom_dns_suffix_configuration}}}{{/custom_dns_suffix_configuration}}
  {{#dedicated_host_count}}dedicated_host_count                   = {{{dedicated_host_count}}}{{/dedicated_host_count}}
  {{#diagnostic_settings}}diagnostic_settings                    = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                       = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#fips_mode_enabled}}fips_mode_enabled                      = {{{fips_mode_enabled}}}{{/fips_mode_enabled}}
  {{#front_end_tls_cipher_suite_order}}front_end_tls_cipher_suite_order       = {{{front_end_tls_cipher_suite_order}}}{{/front_end_tls_cipher_suite_order}}
  {{#ftp_enabled}}ftp_enabled                            = {{{ftp_enabled}}}{{/ftp_enabled}}
  {{#inbound_ip_address_override}}inbound_ip_address_override            = {{{inbound_ip_address_override}}}{{/inbound_ip_address_override}}
  {{#internal_encryption_enabled}}internal_encryption_enabled            = {{{internal_encryption_enabled}}}{{/internal_encryption_enabled}}
  {{#internal_load_balancing_mode}}internal_load_balancing_mode           = {{{internal_load_balancing_mode}}}{{/internal_load_balancing_mode}}
  {{#lock}}lock                                   = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                     = {{{managed_identities}}}{{/managed_identities}}
  {{#remote_debug_enabled}}remote_debug_enabled                   = {{{remote_debug_enabled}}}{{/remote_debug_enabled}}
  {{#retry}}retry                                  = {{{retry}}}{{/retry}}
  {{#role_assignments}}role_assignments                       = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                   = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                               = {{{timeouts}}}{{/timeouts}}
  {{#tls_1_enabled}}tls_1_enabled                          = {{{tls_1_enabled}}}{{/tls_1_enabled}}
  {{#upgrade_preference}}upgrade_preference                     = {{{upgrade_preference}}}{{/upgrade_preference}}
  {{#zone_redundancy_enabled}}zone_redundancy_enabled                = {{{zone_redundancy_enabled}}}{{/zone_redundancy_enabled}}
}
