terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-dataprotection-resourceguard" {
  source  = "Azure/avm-res-dataprotection-resourceguard/azurerm"
  version = "0.1.0"

  {{#location}}location                                = {{{location}}}{{/location}}
  {{#name}}name                                    = {{{name}}}{{/name}}
  {{#resource_group_id}}resource_group_id                       = {{{resource_group_id}}}{{/resource_group_id}}
  {{#enable_telemetry}}enable_telemetry                        = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                    = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments                        = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                    = {{{tags}}}{{/tags}}
  {{#vault_critical_operation_exclusion_list}}vault_critical_operation_exclusion_list = {{{vault_critical_operation_exclusion_list}}}{{/vault_critical_operation_exclusion_list}}
}
