# WARNING: Do not add terraform or provider blocks here to prevent crashes in user environments.

module "{{tfLabel Name}}" {
  source  = "terraform-azurerm-modules/managed-identity/azurerm"
  version = "{{moduleVersion}}"

  # Azure modules usually require a resource group. 
  # Fallback to a default if the UI doesn't send it.
  resource_group_name = "{{#if ResourceGroupName}}{{ResourceGroupName}}{{else}}rg-default-placeholder{{/if}}"
  
  location = "{{Location}}"

  # Gracefully fallback to empty tags object if UI doesn't send them
  tags = {{#if Tags}}{{{Tags}}}{{else}}{}{{/if}}
}