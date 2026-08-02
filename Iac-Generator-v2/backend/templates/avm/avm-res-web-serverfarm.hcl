terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_web_serverfarm" {
  source  = "Azure/avm-res-web-serverfarm/azurerm"
  version = "2.0.8"

  {{#if location}}location                        = {{hclVal location}}{{/if}}
  {{#if name}}name                            = {{hclVal name}}{{/if}}
  {{#if os_type}}os_type                         = {{hclVal os_type}}{{/if}}
  {{#if parent_id}}parent_id                       = {{hclVal parent_id}}{{/if}}
  {{#if app_service_environment_id}}app_service_environment_id      = {{hclVal app_service_environment_id}}{{/if}}
  {{#if async_scaling_enabled}}async_scaling_enabled           = {{hclVal async_scaling_enabled}}{{/if}}
  {{#if diagnostic_settings}}diagnostic_settings             = {{hclVal diagnostic_settings}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                = {{hclVal enable_telemetry}}{{/if}}
  {{#if install_scripts}}install_scripts                 = {{hclVal install_scripts}}{{/if}}
  {{#if lock}}lock                            = {{hclVal lock}}{{/if}}
  {{#if managed_identities}}managed_identities              = {{hclVal managed_identities}}{{/if}}
  {{#if maximum_elastic_worker_count}}maximum_elastic_worker_count    = {{hclVal maximum_elastic_worker_count}}{{/if}}
  {{#if per_site_scaling_enabled}}per_site_scaling_enabled        = {{hclVal per_site_scaling_enabled}}{{/if}}
  {{#if plan_default_identity}}plan_default_identity           = {{hclVal plan_default_identity}}{{/if}}
  {{#if premium_plan_auto_scale_enabled}}premium_plan_auto_scale_enabled = {{hclVal premium_plan_auto_scale_enabled}}{{/if}}
  {{#if rdp_enabled}}rdp_enabled                     = {{hclVal rdp_enabled}}{{/if}}
  {{#if registry_adapters}}registry_adapters               = {{hclVal registry_adapters}}{{/if}}
  {{#if retry}}retry                           = {{hclVal retry}}{{/if}}
  {{#if role_assignments}}role_assignments                = {{hclVal role_assignments}}{{/if}}
  {{#if server_farm_resource_type}}server_farm_resource_type       = {{hclVal server_farm_resource_type}}{{/if}}
  {{#if sku_name}}sku_name                        = {{hclVal sku_name}}{{/if}}
  {{#if storage_mounts}}storage_mounts                  = {{hclVal storage_mounts}}{{/if}}
  {{#if tags}}tags                            = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                        = {{hclVal timeouts}}{{/if}}
  {{#if virtual_network_subnet_id}}virtual_network_subnet_id       = {{hclVal virtual_network_subnet_id}}{{/if}}
  {{#if worker_count}}worker_count                    = {{hclVal worker_count}}{{/if}}
  {{#if zone_balancing_enabled}}zone_balancing_enabled          = {{hclVal zone_balancing_enabled}}{{/if}}
}
