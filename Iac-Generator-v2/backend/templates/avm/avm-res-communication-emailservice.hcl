terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

module "avm_res_communication_emailservice" {
  source  = "Azure/avm-res-communication-emailservice/azurerm"
  version = "0.2.0"

  {{#if data_location}}data_location                                       = {{hclVal data_location}}{{/if}}
  {{#if location}}location                                            = {{hclVal location}}{{/if}}
  {{#if name}}name                                                = {{hclVal name}}{{/if}}
  {{#if resource_group_name}}resource_group_name                                 = {{hclVal resource_group_name}}{{/if}}
  {{#if email_communication_service_domain_sender_usernames}}email_communication_service_domain_sender_usernames = {{hclVal email_communication_service_domain_sender_usernames}}{{/if}}
  {{#if email_communication_service_domains}}email_communication_service_domains                 = {{hclVal email_communication_service_domains}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                    = {{hclVal enable_telemetry}}{{/if}}
  {{#if lock}}lock                                                = {{hclVal lock}}{{/if}}
  {{#if role_assignments}}role_assignments                                    = {{hclVal role_assignments}}{{/if}}
  {{#if tags}}tags                                                = {{hclVal tags}}{{/if}}
}
