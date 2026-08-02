terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-edge-site" {
  source  = "Azure/avm-res-edge-site/azurerm"
  version = "3.0.0"

  {{#country}}country            = {{{country}}}{{/country}}
  {{#resource_group_id}}resource_group_id  = {{{resource_group_id}}}{{/resource_group_id}}
  {{#site_display_name}}site_display_name  = {{{site_display_name}}}{{/site_display_name}}
  {{#site_resource_name}}site_resource_name = {{{site_resource_name}}}{{/site_resource_name}}
  {{#city}}city               = {{{city}}}{{/city}}
  {{#enable_telemetry}}enable_telemetry   = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock               = {{{lock}}}{{/lock}}
  {{#postal_code}}postal_code        = {{{postal_code}}}{{/postal_code}}
  {{#role_assignments}}role_assignments   = {{{role_assignments}}}{{/role_assignments}}
  {{#site_description}}site_description   = {{{site_description}}}{{/site_description}}
  {{#site_labels}}site_labels        = {{{site_labels}}}{{/site_labels}}
  {{#state_or_province}}state_or_province  = {{{state_or_province}}}{{/state_or_province}}
  {{#street_address_1}}street_address_1   = {{{street_address_1}}}{{/street_address_1}}
  {{#street_address_2}}street_address_2   = {{{street_address_2}}}{{/street_address_2}}
  {{#tags}}tags               = {{{tags}}}{{/tags}}
}
