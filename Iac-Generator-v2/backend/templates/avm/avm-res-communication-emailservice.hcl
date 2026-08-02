terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-communication-emailservice" {
  source  = "Azure/avm-res-communication-emailservice/azurerm"
  version = "0.2.0"

  {{#data_location}}data_location                                       = {{{data_location}}}{{/data_location}}
  {{#location}}location                                            = {{{location}}}{{/location}}
  {{#name}}name                                                = {{{name}}}{{/name}}
  {{#resource_group_name}}resource_group_name                                 = {{{resource_group_name}}}{{/resource_group_name}}
  {{#email_communication_service_domain_sender_usernames}}email_communication_service_domain_sender_usernames = {{{email_communication_service_domain_sender_usernames}}}{{/email_communication_service_domain_sender_usernames}}
  {{#email_communication_service_domains}}email_communication_service_domains                 = {{{email_communication_service_domains}}}{{/email_communication_service_domains}}
  {{#enable_telemetry}}enable_telemetry                                    = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#lock}}lock                                                = {{{lock}}}{{/lock}}
  {{#role_assignments}}role_assignments                                    = {{{role_assignments}}}{{/role_assignments}}
  {{#tags}}tags                                                = {{{tags}}}{{/tags}}
}
