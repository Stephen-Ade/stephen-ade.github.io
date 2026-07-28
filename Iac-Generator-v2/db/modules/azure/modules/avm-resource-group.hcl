# WARNING: Do not add terraform or provider blocks here to prevent
# conflicts in user environments.

module "{{tfLabel name}}" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "{{moduleVersion}}"

  name     = "{{name}}"
  location = "{{location}}"

{{#if tags}}
  tags = {{{tags}}}
{{/if}}
}
