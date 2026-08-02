terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-management-servicegroup" {
  source  = "Azure/avm-res-management-servicegroup/azurerm"
  version = "0.1.0"

  {{#name}}name                    = {{{name}}}{{/name}}
  {{#display_name}}display_name            = {{{display_name}}}{{/display_name}}
  {{#enable_telemetry}}enable_telemetry        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#parent_service_group_id}}parent_service_group_id = {{{parent_service_group_id}}}{{/parent_service_group_id}}
  {{#role_assignments}}role_assignments        = {{{role_assignments}}}{{/role_assignments}}
  {{#service_group_members}}service_group_members   = {{{service_group_members}}}{{/service_group_members}}
}
