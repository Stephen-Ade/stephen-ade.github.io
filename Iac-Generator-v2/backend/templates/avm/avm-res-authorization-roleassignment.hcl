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

  {{#if app_registrations_by_client_id}}app_registrations_by_client_id                              = {{hclVal app_registrations_by_client_id}}{{/if}}
  {{#if app_registrations_by_display_name}}app_registrations_by_display_name                           = {{hclVal app_registrations_by_display_name}}{{/if}}
  {{#if app_registrations_by_object_id}}app_registrations_by_object_id                              = {{hclVal app_registrations_by_object_id}}{{/if}}
  {{#if app_registrations_by_principal_id}}app_registrations_by_principal_id                           = {{hclVal app_registrations_by_principal_id}}{{/if}}
  {{#if enable_telemetry}}enable_telemetry                                            = {{hclVal enable_telemetry}}{{/if}}
  {{#if entra_id_role_definitions}}entra_id_role_definitions                                   = {{hclVal entra_id_role_definitions}}{{/if}}
  {{#if groups_by_display_name}}groups_by_display_name                                      = {{hclVal groups_by_display_name}}{{/if}}
  {{#if groups_by_mail_nickname}}groups_by_mail_nickname                                     = {{hclVal groups_by_mail_nickname}}{{/if}}
  {{#if groups_by_object_id}}groups_by_object_id                                         = {{hclVal groups_by_object_id}}{{/if}}
  {{#if role_assignments_azure_resource_manager}}role_assignments_azure_resource_manager                     = {{hclVal role_assignments_azure_resource_manager}}{{/if}}
  {{#if role_assignments_entra_id}}role_assignments_entra_id                                   = {{hclVal role_assignments_entra_id}}{{/if}}
  {{#if role_assignments_for_entra_id}}role_assignments_for_entra_id                               = {{hclVal role_assignments_for_entra_id}}{{/if}}
  {{#if role_assignments_for_management_groups}}role_assignments_for_management_groups                      = {{hclVal role_assignments_for_management_groups}}{{/if}}
  {{#if role_assignments_for_resource_groups}}role_assignments_for_resource_groups                        = {{hclVal role_assignments_for_resource_groups}}{{/if}}
  {{#if role_assignments_for_resources}}role_assignments_for_resources                              = {{hclVal role_assignments_for_resources}}{{/if}}
  {{#if role_assignments_for_scopes}}role_assignments_for_scopes                                 = {{hclVal role_assignments_for_scopes}}{{/if}}
  {{#if role_assignments_for_subscriptions}}role_assignments_for_subscriptions                          = {{hclVal role_assignments_for_subscriptions}}{{/if}}
  {{#if role_definitions}}role_definitions                                            = {{hclVal role_definitions}}{{/if}}
  {{#if skip_service_principal_aad_check}}skip_service_principal_aad_check                            = {{hclVal skip_service_principal_aad_check}}{{/if}}
  {{#if system_assigned_managed_identities_by_client_id}}system_assigned_managed_identities_by_client_id             = {{hclVal system_assigned_managed_identities_by_client_id}}{{/if}}
  {{#if system_assigned_managed_identities_by_display_name}}system_assigned_managed_identities_by_display_name          = {{hclVal system_assigned_managed_identities_by_display_name}}{{/if}}
  {{#if system_assigned_managed_identities_by_principal_id}}system_assigned_managed_identities_by_principal_id          = {{hclVal system_assigned_managed_identities_by_principal_id}}{{/if}}
  {{#if user_assigned_managed_identities_by_client_id}}user_assigned_managed_identities_by_client_id               = {{hclVal user_assigned_managed_identities_by_client_id}}{{/if}}
  {{#if user_assigned_managed_identities_by_display_name}}user_assigned_managed_identities_by_display_name            = {{hclVal user_assigned_managed_identities_by_display_name}}{{/if}}
  {{#if user_assigned_managed_identities_by_principal_id}}user_assigned_managed_identities_by_principal_id            = {{hclVal user_assigned_managed_identities_by_principal_id}}{{/if}}
  {{#if user_assigned_managed_identities_by_resource_group_and_name}}user_assigned_managed_identities_by_resource_group_and_name = {{hclVal user_assigned_managed_identities_by_resource_group_and_name}}{{/if}}
  {{#if users_by_employee_id}}users_by_employee_id                                        = {{hclVal users_by_employee_id}}{{/if}}
  {{#if users_by_mail}}users_by_mail                                               = {{hclVal users_by_mail}}{{/if}}
  {{#if users_by_mail_nickname}}users_by_mail_nickname                                      = {{hclVal users_by_mail_nickname}}{{/if}}
  {{#if users_by_object_id}}users_by_object_id                                          = {{hclVal users_by_object_id}}{{/if}}
  {{#if users_by_user_principal_name}}users_by_user_principal_name                                = {{hclVal users_by_user_principal_name}}{{/if}}
}
