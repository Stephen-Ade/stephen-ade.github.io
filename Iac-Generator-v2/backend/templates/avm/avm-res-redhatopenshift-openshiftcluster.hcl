terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-redhatopenshift-openshiftcluster" {
  source  = "Azure/avm-res-redhatopenshift-openshiftcluster/azurerm"
  version = "0.0.2"

  {{#api_server_profile}}api_server_profile                      = {{{api_server_profile}}}{{/api_server_profile}}
  {{#cluster_profile}}cluster_profile                         = {{{cluster_profile}}}{{/cluster_profile}}
  {{#ingress_profile}}ingress_profile                         = {{{ingress_profile}}}{{/ingress_profile}}
  {{#location}}location                                = {{{location}}}{{/location}}
  {{#main_profile}}main_profile                            = {{{main_profile}}}{{/main_profile}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#network_profile}}network_profile                         = {{{network_profile}}}{{/network_profile}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#worker_profile}}worker_profile                          = {{{worker_profile}}}{{/worker_profile}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#platform_workload_identities}}platform_workload_identities            = {{{platform_workload_identities}}}{{/platform_workload_identities}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#service_principal}}service_principal                       = {{{service_principal}}}{{/service_principal}}
  {{#subscription_id}}subscription_id                         = {{{subscription_id}}}{{/subscription_id}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                                = {{{timeouts}}}{{/timeouts}}
}
