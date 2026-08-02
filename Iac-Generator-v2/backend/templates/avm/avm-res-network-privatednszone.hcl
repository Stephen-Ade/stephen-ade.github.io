terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_network_privatednszone" {
  source  = "Azure/avm-res-network-privatednszone/azurerm"
  version = "0.5.0"

  {{#if domain_name}}domain_name                          = {{hclVal domain_name}}{{/if}}
  {{#if parent_id}}parent_id                            = {{hclVal parent_id}}{{/if}}
  {{#if a_records}}a_records                            = {{hclVal a_records}}{{/if}}
  {{#if aaaa_records}}aaaa_records                         = {{hclVal aaaa_records}}{{/if}}
  {{#if cname_records}}cname_records                        = {{hclVal cname_records}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                     = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                 = {{hclVal lock}}{{/if}}
  {{#if mx_records}}mx_records                           = {{hclVal mx_records}}{{/if}}
  {{#if ptr_records}}ptr_records                          = {{hclVal ptr_records}}{{/if}}
  {{#if retry}}retry                                = {{hclVal retry}}{{/if}}
  {{#if role_assignment_name_use_random_uuid}}role_assignment_name_use_random_uuid = {{hclVal role_assignment_name_use_random_uuid}}{{/if}}
  {{#if role_assignments}}role_assignments                     = {{hclVal role_assignments}}{{/if}}
  {{#if soa_record}}soa_record                           = {{hclVal soa_record}}{{/if}}
  {{#if srv_records}}srv_records                          = {{hclVal srv_records}}{{/if}}
  {{#if tags}}tags                                 = {{hclVal tags}}{{/if}}
  {{#if timeouts}}timeouts                             = {{hclVal timeouts}}{{/if}}
  {{#if txt_records}}txt_records                          = {{hclVal txt_records}}{{/if}}
  {{#if virtual_network_links}}virtual_network_links                = {{hclVal virtual_network_links}}{{/if}}
}
