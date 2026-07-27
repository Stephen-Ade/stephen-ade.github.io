# WARNING: Do not add terraform or provider blocks here to prevent crashes in user environments.

module "{{tfLabel Name}}" {
  source  = "terraform-azurerm-modules/resource-group/azurerm"
  version = "{{moduleVersion}}"

  name     = "{{Name}}"
  location = "{{Location}}"

  # Gracefully fallback to empty tags object if UI doesn't send them
  tags = {{#if Tags}}{{{Tags}}}{{else}}{}{{/if}}
}