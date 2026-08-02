terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-privatednszone" {
  source  = "Azure/avm-res-network-privatednszone/azurerm"
  version = "0.5.0"

  {{#domain_name}}domain_name                          = {{{domain_name}}}{{/domain_name}}
  {{#parent_id}}parent_id                            = {{{parent_id}}}{{/parent_id}}
  {{#a_records}}a_records                            = {{{a_records}}}{{/a_records}}
  {{#aaaa_records}}aaaa_records                         = {{{aaaa_records}}}{{/aaaa_records}}
  {{#cname_records}}cname_records                        = {{{cname_records}}}{{/cname_records}}
  {{#enable_telemetry}}enable_telemetry                     = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                 = {{{lock}}}{{/lock}}
  {{#mx_records}}mx_records                           = {{{mx_records}}}{{/mx_records}}
  {{#ptr_records}}ptr_records                          = {{{ptr_records}}}{{/ptr_records}}
  {{#retry}}retry                                = {{{retry}}}{{/retry}}
  {{#role_assignment_name_use_random_uuid}}role_assignment_name_use_random_uuid = {{{role_assignment_name_use_random_uuid}}}{{/role_assignment_name_use_random_uuid}}
  {{#role_assignments}}role_assignments                     = {{{role_assignments}}}{{/role_assignments}}
  {{#soa_record}}soa_record                           = {{{soa_record}}}{{/soa_record}}
  {{#srv_records}}srv_records                          = {{{srv_records}}}{{/srv_records}}
  {{#tags}}tags                                 = {{{tags}}}{{/tags}}
  {{#timeouts}}timeouts                             = {{{timeouts}}}{{/timeouts}}
  {{#txt_records}}txt_records                          = {{{txt_records}}}{{/txt_records}}
  {{#virtual_network_links}}virtual_network_links                = {{{virtual_network_links}}}{{/virtual_network_links}}
}
