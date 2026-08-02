terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-sshpublickey" {
  source  = "Azure/avm-res-compute-sshpublickey/azurerm"
  version = "0.1.0"

  {{#name}}name                = {{{name}}}{{/name}}
  {{#public_key}}public_key          = {{{public_key}}}{{/public_key}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#location}}location            = {{{location}}}{{/location}}
  {{#lock}}lock                = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities  = {{{managed_identities}}}{{/managed_identities}}
  {{#role_assignments}}role_assignments    = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
}
