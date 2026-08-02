terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_redhatopenshift_openshiftcluster" {
  source  = "Azure/avm-res-redhatopenshift-openshiftcluster/azurerm"
  version = "0.0.2"

  {{#if api_server_profile}}api_server_profile                      = {{hclVal api_server_profile}}{{/if}}
  {{#if cluster_profile}}cluster_profile                         = {{hclVal cluster_profile}}{{/if}}
  {{#if ingress_profile}}ingress_profile                         = {{hclVal ingress_profile}}{{/if}}
  {{#if location}}location                                = {{hclVal location}}{{/if}}
  {{#if main_profile}}main_profile                            = {{hclVal main_profile}}{{/if}}
  {{#if name}}name                                    = {{hclVal name}}{{/if}}
  {{#if network_profile}}network_profile                         = {{hclVal network_profile}}{{/if}}
  {{#if resource_group_name}}resource_group_name                     = {{hclVal resource_group_name}}{{/if}}
  {{#if worker_profile}}worker_profile                          = {{hclVal worker_profile}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                        = {{hclVal enable_telemetry}}{{/if}}
  {{#if managed_identities}}managed_identities                      = {{hclVal managed_identities}}{{/if}}
  {{#if platform_workload_identities}}platform_workload_identities            = {{hclVal platform_workload_identities}}{{/if}}
  {{#if private_endpoints}}private_endpoints                       = {{hclVal private_endpoints}}{{/if}}
  {{#if private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{hclVal private_endpoints_manage_dns_zone_group}}{{/if}}
  {{#if role_assignments}}role_assignments                        = {{hclVal role_assignments}}{{/if}}
  {{#if service_principal}}service_principal                       = {{hclVal service_principal}}{{/if}}
  {{#if subscription_id}}subscription_id                         = {{hclVal subscription_id}}{{/if}}
  {{#if tags}}tags                                    = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                                = {{hclVal timeouts}}{{/if}}
}
