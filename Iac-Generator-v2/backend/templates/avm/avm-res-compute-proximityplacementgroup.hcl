terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-proximityplacementgroup" {
  source  = "Azure/avm-res-compute-proximityplacementgroup/azurerm"
  version = "0.1.0"

  {{#location}}location            = {{{location}}}{{/location}}
  {{#name}}name                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name = {{{resource_group_name}}}{{/resource_group_name}}
  {{#allowed_vm_sizes}}allowed_vm_sizes    = {{{allowed_vm_sizes}}}{{/allowed_vm_sizes}}
  {{#enable_telemetry}}enable_telemetry    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                = {{{lock}}}{{/lock}}
  {{#tags}}tags                = {{{tags}}}{{/tags}}
  {{#zone}}zone                = {{{zone}}}{{/zone}}
}
