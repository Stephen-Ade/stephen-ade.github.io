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

  {{#location}}location                            = {{{location}}}{{/location}}
  {{#name}}name                                = {{{name}}}{{/name}}
  {{#os_type}}os_type                             = {{{os_type}}}{{/os_type}}
  {{#resource_group_name}}resource_group_name                 = {{{resource_group_name}}}{{/resource_group_name}}
  {{#restart_policy}}restart_policy                      = {{{restart_policy}}}{{/restart_policy}}
  {{#containers}}containers                          = {{{containers}}}{{/containers}}
  {{#diagnostics_log_analytics}}diagnostics_log_analytics           = {{{diagnostics_log_analytics}}}{{/diagnostics_log_analytics}}
  {{#dns_name_label}}dns_name_label                      = {{{dns_name_label}}}{{/dns_name_label}}
  {{#dns_name_label_reuse_policy}}dns_name_label_reuse_policy         = {{{dns_name_label_reuse_policy}}}{{/dns_name_label_reuse_policy}}
  {{#dns_name_servers}}dns_name_servers                    = {{{dns_name_servers}}}{{/dns_name_servers}}
  {{#enable_telemetry}}enable_telemetry                    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#exposed_ports}}exposed_ports                       = {{{exposed_ports}}}{{/exposed_ports}}
  {{#image_registry_credential}}image_registry_credential           = {{{image_registry_credential}}}{{/image_registry_credential}}
  {{#key_vault_key_id}}key_vault_key_id                    = {{{key_vault_key_id}}}{{/key_vault_key_id}}
  {{#key_vault_user_assigned_identity_id}}key_vault_user_assigned_identity_id = {{{key_vault_user_assigned_identity_id}}}{{/key_vault_user_assigned_identity_id}}
  {{#liveness_probe}}liveness_probe                      = {{{liveness_probe}}}{{/liveness_probe}}
  {{#managed_identities}}managed_identities                  = {{{managed_identities}}}{{/managed_identities}}
  {{#priority}}priority                            = {{{priority}}}{{/priority}}
  {{#private_endpoints}}private_endpoints                   = {{{private_endpoints}}}{{/private_endpoints}}
  {{#readiness_probe}}readiness_probe                     = {{{readiness_probe}}}{{/readiness_probe}}
  {{#role_assignments}}role_assignments                    = {{{role_assignments}}}{{/role_assignments}}
  {{#subnet_ids}}subnet_ids                          = {{{subnet_ids}}}{{/subnet_ids}}
  {{#tags}}tags                                = {{{tags}}}{{/tags}}
  {{#zones}}zones                               = {{{zones}}}{{/zones}}
}
