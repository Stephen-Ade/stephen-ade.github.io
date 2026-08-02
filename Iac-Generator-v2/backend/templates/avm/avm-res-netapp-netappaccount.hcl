terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-netapp-netappaccount" {
  source  = "Azure/avm-res-netapp-netappaccount/azurerm"
  version = "0.3.0"

  {{#location}}location                          = {{{location}}}{{/location}}
  {{#name}}name                              = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name               = {{{resource_group_name}}}{{/resource_group_name}}
  {{#active_directories}}active_directories                = {{{active_directories}}}{{/active_directories}}
  {{#backup_policies}}backup_policies                   = {{{backup_policies}}}{{/backup_policies}}
  {{#backup_vaults}}backup_vaults                     = {{{backup_vaults}}}{{/backup_vaults}}
  {{#capacity_pools}}capacity_pools                    = {{{capacity_pools}}}{{/capacity_pools}}
  {{#enable_telemetry}}enable_telemetry                  = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#inherit_tags_from_parent_resource}}inherit_tags_from_parent_resource = {{{inherit_tags_from_parent_resource}}}{{/inherit_tags_from_parent_resource}}
  {{#lock}}lock                              = {{{lock}}}{{/lock}}
  {{#managed_identities}}managed_identities                = {{{managed_identities}}}{{/managed_identities}}
  {{#role_assignments}}role_assignments                  = {{{role_assignments}}}{{/role_assignments}}
  {{#snapshot_policies}}snapshot_policies                 = {{{snapshot_policies}}}{{/snapshot_policies}}
  {{#subscription_id}}subscription_id                   = {{{subscription_id}}}{{/subscription_id}}
  {{#tags}}tags                              = {{{tags}}}{{/tags}}
  {{#volumes}}volumes                           = {{{volumes}}}{{/volumes}}
}
