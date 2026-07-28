# WARNING: Do not add terraform or provider blocks here to prevent
# conflicts in user environments.

module "{{tfLabel name}}" {
  source  = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
  version = "{{moduleVersion}}"

  name                = "{{name}}"
  resource_group_name = "{{resource_group_name}}"
  location            = "{{location}}"

{{#if tags}}
  tags = {{{tags}}}
{{/if}}
}
