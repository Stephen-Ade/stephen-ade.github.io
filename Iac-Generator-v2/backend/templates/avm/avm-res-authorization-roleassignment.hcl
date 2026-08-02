terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-authorization-roleassignment" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.3.1"

  {{#app_registrations_by_client_id}}app_registrations_by_client_id                              = {{{app_registrations_by_client_id}}}{{/app_registrations_by_client_id}}
  {{#app_registrations_by_display_name}}app_registrations_by_display_name                           = {{{app_registrations_by_display_name}}}{{/app_registrations_by_display_name}}
  {{#app_registrations_by_object_id}}app_registrations_by_object_id                              = {{{app_registrations_by_object_id}}}{{/app_registrations_by_object_id}}
  {{#app_registrations_by_principal_id}}app_registrations_by_principal_id                           = {{{app_registrations_by_principal_id}}}{{/app_registrations_by_principal_id}}
  {{#enable_telemetry}}enable_telemetry                                            = {{{enable_telemetry}}}{{/enable_telemetry}}
  {{#entra_id_role_definitions}}entra_id_role_definitions                                   = {{{entra_id_role_definitions}}}{{/entra_id_role_definitions}}
  {{#groups_by_display_name}}groups_by_display_name                                      = {{{groups_by_display_name}}}{{/groups_by_display_name}}
  {{#groups_by_mail_nickname}}groups_by_mail_nickname                                     = {{{groups_by_mail_nickname}}}{{/groups_by_mail_nickname}}
  {{#groups_by_object_id}}groups_by_object_id                                         = {{{groups_by_object_id}}}{{/groups_by_object_id}}
  {{#role_assignments_azure_resource_manager}}role_assignments_azure_resource_manager                     = {{{role_assignments_azure_resource_manager}}}{{/role_assignments_azure_resource_manager}}
  {{#role_assignments_entra_id}}role_assignments_entra_id                                   = {{{role_assignments_entra_id}}}{{/role_assignments_entra_id}}
  {{#role_assignments_for_entra_id}}role_assignments_for_entra_id                               = {{{role_assignments_for_entra_id}}}{{/role_assignments_for_entra_id}}
  {{#role_assignments_for_management_groups}}role_assignments_for_management_groups                      = {{{role_assignments_for_management_groups}}}{{/role_assignments_for_management_groups}}
  {{#role_assignments_for_resource_groups}}role_assignments_for_resource_groups                        = {{{role_assignments_for_resource_groups}}}{{/role_assignments_for_resource_groups}}
  {{#role_assignments_for_resources}}role_assignments_for_resources                              = {{{role_assignments_for_resources}}}{{/role_assignments_for_resources}}
  {{#role_assignments_for_scopes}}role_assignments_for_scopes                                 = {{{role_assignments_for_scopes}}}{{/role_assignments_for_scopes}}
  {{#role_assignments_for_subscriptions}}role_assignments_for_subscriptions                          = {{{role_assignments_for_subscriptions}}}{{/role_assignments_for_subscriptions}}
  {{#role_definitions}}role_definitions                                            = {{{role_definitions}}}{{/role_definitions}}
  {{#skip_service_principal_aad_check}}skip_service_principal_aad_check                            = {{{skip_service_principal_aad_check}}}{{/skip_service_principal_aad_check}}
  {{#system_assigned_managed_identities_by_client_id}}system_assigned_managed_identities_by_client_id             = {{{system_assigned_managed_identities_by_client_id}}}{{/system_assigned_managed_identities_by_client_id}}
  {{#system_assigned_managed_identities_by_display_name}}system_assigned_managed_identities_by_display_name          = {{{system_assigned_managed_identities_by_display_name}}}{{/system_assigned_managed_identities_by_display_name}}
  {{#system_assigned_managed_identities_by_principal_id}}system_assigned_managed_identities_by_principal_id          = {{{system_assigned_managed_identities_by_principal_id}}}{{/system_assigned_managed_identities_by_principal_id}}
  {{#user_assigned_managed_identities_by_client_id}}user_assigned_managed_identities_by_client_id               = {{{user_assigned_managed_identities_by_client_id}}}{{/user_assigned_managed_identities_by_client_id}}
  {{#user_assigned_managed_identities_by_display_name}}user_assigned_managed_identities_by_display_name            = {{{user_assigned_managed_identities_by_display_name}}}{{/user_assigned_managed_identities_by_display_name}}
  {{#user_assigned_managed_identities_by_principal_id}}user_assigned_managed_identities_by_principal_id            = {{{user_assigned_managed_identities_by_principal_id}}}{{/user_assigned_managed_identities_by_principal_id}}
  {{#user_assigned_managed_identities_by_resource_group_and_name}}user_assigned_managed_identities_by_resource_group_and_name = {{{user_assigned_managed_identities_by_resource_group_and_name}}}{{/user_assigned_managed_identities_by_resource_group_and_name}}
  {{#users_by_employee_id}}users_by_employee_id                                        = {{{users_by_employee_id}}}{{/users_by_employee_id}}
  {{#users_by_mail}}users_by_mail                                               = {{{users_by_mail}}}{{/users_by_mail}}
  {{#users_by_mail_nickname}}users_by_mail_nickname                                      = {{{users_by_mail_nickname}}}{{/users_by_mail_nickname}}
  {{#users_by_object_id}}users_by_object_id                                          = {{{users_by_object_id}}}{{/users_by_object_id}}
  {{#users_by_user_principal_name}}users_by_user_principal_name                                = {{{users_by_user_principal_name}}}{{/users_by_user_principal_name}}
}
