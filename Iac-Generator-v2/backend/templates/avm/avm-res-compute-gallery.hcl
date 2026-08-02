terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-compute-gallery" {
  source  = "Azure/avm-res-compute-gallery/azurerm"
  version = "0.2.1"

  {{#location}}location                 = {{{location}}}{{/location}}
  {{#name}}name                     = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name      = {{{resource_group_name}}}{{/resource_group_name}}
  {{#description}}description              = {{{description}}}{{/description}}
  {{#enable_telemetry}}enable_telemetry         = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                     = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments         = {{{role_assignments}}}{{/role_assignments}}
  {{#shared_image_definitions}}shared_image_definitions = {{{shared_image_definitions}}}{{/shared_image_definitions}}
  {{#sharing}}sharing                  = {{{sharing}}}{{/sharing}}
  {{#tags}}tags                     = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                 = {{{timeouts}}}{{/timeouts}}
}
