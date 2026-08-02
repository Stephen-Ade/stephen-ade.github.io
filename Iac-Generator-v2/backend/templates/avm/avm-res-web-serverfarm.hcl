terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-web-serverfarm" {
  source  = "Azure/avm-res-web-serverfarm/azurerm"
  version = "2.0.8"

  {{#location}}location                        = {{{location}}}{{/location}}
  {{#name}}name                            = {{{name}}}{{/name}}
  {{#os_type}}os_type                         = {{{os_type}}}{{/os_type}}
  {{#parent_id}}parent_id                       = {{{parent_id}}}{{/parent_id}}
  {{#app_service_environment_id}}app_service_environment_id      = {{{app_service_environment_id}}}{{/app_service_environment_id}}
  {{#async_scaling_enabled}}async_scaling_enabled           = {{{async_scaling_enabled}}}{{/async_scaling_enabled}}
  {{#diagnostic_settings}}diagnostic_settings             = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#install_scripts}}install_scripts                 = {{{install_scripts}}}{{/install_scripts}}
  {{#lock}}lock                            = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities              = {{{managed_identities}}}{{/managed_identities}}
  {{#maximum_elastic_worker_count}}maximum_elastic_worker_count    = {{{maximum_elastic_worker_count}}}{{/maximum_elastic_worker_count}}
  {{#per_site_scaling_enabled}}per_site_scaling_enabled        = {{{per_site_scaling_enabled}}}{{/per_site_scaling_enabled}}
  {{#plan_default_identity}}plan_default_identity           = {{{plan_default_identity}}}{{/plan_default_identity}}
  {{#premium_plan_auto_scale_enabled}}premium_plan_auto_scale_enabled = {{{premium_plan_auto_scale_enabled}}}{{/premium_plan_auto_scale_enabled}}
  {{#rdp_enabled}}rdp_enabled                     = {{{rdp_enabled}}}{{/rdp_enabled}}
  {{#registry_adapters}}registry_adapters               = {{{registry_adapters}}}{{/registry_adapters}}
  {{#retry}}retry                           = {{{retry}}}{{/retry}}
  {{#role_assignments}}role_assignments                = {{{role_assignments}}}{{/role_assignments}}
  {{#server_farm_resource_type}}server_farm_resource_type       = {{{server_farm_resource_type}}}{{/server_farm_resource_type}}
  {{#sku_name}}sku_name                        = {{{sku_name}}}{{/sku_name}}
  {{#storage_mounts}}storage_mounts                  = {{{storage_mounts}}}{{/storage_mounts}}
  {{#tags}}tags                            = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                        = {{{timeouts}}}{{/timeouts}}
  {{#virtual_network_subnet_id}}virtual_network_subnet_id       = {{{virtual_network_subnet_id}}}{{/virtual_network_subnet_id}}
  {{#worker_count}}worker_count                    = {{{worker_count}}}{{/worker_count}}
  {{#zone_balancing_enabled}}zone_balancing_enabled          = {{{zone_balancing_enabled}}}{{/zone_balancing_enabled}}
}
