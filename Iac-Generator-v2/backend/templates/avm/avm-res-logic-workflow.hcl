terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-logic-workflow" {
  source  = "Azure/avm-res-logic-workflow/azurerm"
  version = "0.1.2"

  {{#location}}location                           = {{{location}}}{{/location}}
  {{#name}}name                               = {{{name}}}{{/name}}
  {{#resource_group_id}}resource_group_id                  = {{{resource_group_id}}}{{/resource_group_id}}
  {{#resource_group_name}}resource_group_name                = {{{resource_group_name}}}{{/resource_group_name}}
  {{#access_control}}access_control                     = {{{access_control}}}{{/access_control}}
  {{#diagnostic_settings}}diagnostic_settings                = {{{diagnostic_settings}}}{{/diagnostic_settings}}
  {{#enable_telemetry}}enable_telemetry                   = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#endpoints_configuration}}endpoints_configuration            = {{{endpoints_configuration}}}{{/endpoints_configuration}}
  {{#integration_account_id}}integration_account_id             = {{{integration_account_id}}}{{/integration_account_id}}
  {{#integration_service_environment_id}}integration_service_environment_id = {{{integration_service_environment_id}}}{{/integration_service_environment_id}}
  {{#lock}}lock                               = {{{lock}}}{{/lock}}
  {{#logic_app_definition}}logic_app_definition               = {{{logic_app_definition}}}{{/logic_app_definition}}
  {{#managed_identities}}managed_identities                 = {{{managed_identities}}}{{/managed_identities}}
  {{#role_assignments}}role_assignments                   = {{{role_assignments}}}{{/role_assignments}}
  {{#state}}state                              = {{{state}}}{{/state}}
  {{#tags}}tags                               = {{{tags}}}{{/tags}}
  {{#workflow_parameters}}workflow_parameters                = {{{workflow_parameters}}}{{/workflow_parameters}}
}
