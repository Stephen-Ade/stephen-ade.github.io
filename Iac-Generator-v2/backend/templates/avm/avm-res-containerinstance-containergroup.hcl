terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-containerinstance-containergroup" {
  source  = "Azure/avm-res-containerinstance-containergroup/azurerm"
  version = "0.2.0"

  {{#if location}}location                            = {{hclVal location}}{{/if}}
  {{#if name}}name                                = {{hclVal name}}{{/if}}
  {{#if os_type}}os_type                             = {{hclVal os_type}}{{/if}}
  {{#if resource_group_name}}resource_group_name                 = {{hclVal resource_group_name}}{{/if}}
  {{#if restart_policy}}restart_policy                      = {{hclVal restart_policy}}{{/if}}
  {{#if containers}}containers                          = {{hclVal containers}}{{/if}}
  {{#if diagnostics_log_analytics}}diagnostics_log_analytics           = {{hclVal diagnostics_log_analytics}}{{/if}}
  {{#if dns_name_label}}dns_name_label                      = {{hclVal dns_name_label}}{{/if}}
  {{#if dns_name_label_reuse_policy}}dns_name_label_reuse_policy         = {{hclVal dns_name_label_reuse_policy}}{{/if}}
  {{#if dns_name_servers}}dns_name_servers                    = {{hclVal dns_name_servers}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                    = {{hclVal enable_telemetry}}{{/if}}
  {{#if exposed_ports}}exposed_ports                       = {{hclVal exposed_ports}}{{/if}}
  {{#if image_registry_credential}}image_registry_credential           = {{hclVal image_registry_credential}}{{/if}}
  {{#if key_vault_key_id}}key_vault_key_id                    = {{hclVal key_vault_key_id}}{{/if}}
  {{#if key_vault_user_assigned_identity_id}}key_vault_user_assigned_identity_id = {{hclVal key_vault_user_assigned_identity_id}}{{/if}}
  {{#if liveness_probe}}liveness_probe                      = {{hclVal liveness_probe}}{{/if}}
  {{#if managed_identities}}managed_identities                  = {{hclVal managed_identities}}{{/if}}
  {{#if priority}}priority                            = {{hclVal priority}}{{/if}}
  {{#if private_endpoints}}private_endpoints                   = {{hclVal private_endpoints}}{{/if}}
  {{#if readiness_probe}}readiness_probe                     = {{hclVal readiness_probe}}{{/if}}
  {{#if role_assignments}}role_assignments                    = {{hclVal role_assignments}}{{/if}}
  {{#if subnet_ids}}subnet_ids                          = {{hclVal subnet_ids}}{{/if}}
  {{#if tags}}tags                                = {{hclVal tags}}{{/if}}
  {{#if zones}}zones                               = {{hclVal zones}}{{/if}}
}
