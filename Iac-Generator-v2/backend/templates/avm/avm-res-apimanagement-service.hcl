terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-apimanagement-service" {
  source  = "Azure/avm-res-apimanagement-service/azurerm"
  version = "0.9.0"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#publisher_email}}publisher_email                         = {{{publisher_email}}}{{/publisher_email}}
  {{#resource_group_name}}resource_group_name                     = {{{resource_group_name}}}{{/resource_group_name}}
  {{#additional_location}}additional_location                     = {{{additional_location}}}{{/additional_location}}
  {{#api_version_sets}}api_version_sets                        = {{{api_version_sets}}}{{/api_version_sets}}
  {{#apis}}apis                                    = {{{apis}}}{{/apis}}
  {{#backends}}backends                                = {{{backends}}}{{/backends}}
  {{#certificate}}certificate                             = {{{certificate}}}{{/certificate}}
  {{#client_certificate_enabled}}client_certificate_enabled              = {{{client_certificate_enabled}}}{{/client_certificate_enabled}}
  {{#delegation}}delegation                              = {{{delegation}}}{{/delegation}}
  {{#diagnostic_settings}}diagnostic_settings                     = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#gateway_disabled}}gateway_disabled                        = {{{gateway_disabled}}}{{/gateway_disabled}}
  {{#hostname_configuration}}hostname_configuration                  = {{{hostname_configuration}}}{{/hostname_configuration}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                      = {{{managed_identities}}}{{/managed_identities}}
  {{#min_api_version}}min_api_version                         = {{{min_api_version}}}{{/min_api_version}}
  {{#named_values}}named_values                            = {{{named_values}}}{{/named_values}}
  {{#notification_sender_email}}notification_sender_email               = {{{notification_sender_email}}}{{/notification_sender_email}}
  {{#policy}}policy                                  = {{{policy}}}{{/policy}}
  {{#private_endpoints}}private_endpoints                       = {{{private_endpoints}}}{{/private_endpoints}}
  {{#private_endpoints_manage_dns_zone_group}}private_endpoints_manage_dns_zone_group = {{{private_endpoints_manage_dns_zone_group}}}{{/private_endpoints_manage_dns_zone_group}}
  {{#products}}products                                = {{{products}}}{{/products}}
  {{#protocols}}protocols                               = {{{protocols}}}{{/protocols}}
  {{#public_ip_address_id}}public_ip_address_id                    = {{{public_ip_address_id}}}{{/public_ip_address_id}}
  {{#public_network_access_enabled}}public_network_access_enabled           = {{{public_network_access_enabled}}}{{/public_network_access_enabled}}
  {{#publisher_name}}publisher_name                          = {{{publisher_name}}}{{/publisher_name}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#security}}security                                = {{{security}}}{{/security}}
  {{#sign_in}}sign_in                                 = {{{sign_in}}}{{/sign_in}}
  {{#sign_up}}sign_up                                 = {{{sign_up}}}{{/sign_up}}
  {{#sku_name}}sku_name                                = {{{sku_name}}}{{/sku_name}}
  {{#subscriptions}}subscriptions                           = {{{subscriptions}}}{{/subscriptions}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#tenant_access}}tenant_access                           = {{{tenant_access}}}{{/tenant_access}}
  {{#virtual_network_subnet_id}}virtual_network_subnet_id               = {{{virtual_network_subnet_id}}}{{/virtual_network_subnet_id}}
  {{#virtual_network_type}}virtual_network_type                    = {{{virtual_network_type}}}{{/virtual_network_type}}
  {{#zones}}zones                                   = {{{zones}}}{{/zones}}
}
