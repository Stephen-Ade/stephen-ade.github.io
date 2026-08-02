terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-capacityreservationgroup" {
  source  = "Azure/avm-res-compute-capacityreservationgroup/azurerm"
  version = "0.1.0"

  {{#capacity_reservation_group_name}}capacity_reservation_group_name         = {{{capacity_reservation_group_name}}}{{/capacity_reservation_group_name}}
  {{#location}}location                                = {{{location}}}{{/location}}
  {{#resource_group_id}}resource_group_id                       = {{{resource_group_id}}}{{/resource_group_id}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#schema_validation_enabled}}schema_validation_enabled               = {{{schema_validation_enabled}}}{{/schema_validation_enabled}}
  {{#sharing_profile}}sharing_profile                         = {{{sharing_profile}}}{{/sharing_profile}}
  {{#subscription_id}}subscription_id                         = {{{subscription_id}}}{{/subscription_id}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#zones}}zones                                   = {{{zones}}}{{/zones}}
}
