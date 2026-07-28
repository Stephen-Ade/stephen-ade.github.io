# WARNING: Do not add terraform or provider blocks here to prevent
# conflicts in user environments.

module "{{tfLabel name}}" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "{{moduleVersion}}"

  name                = "{{name}}"
  resource_group_name = "{{resource_group_name}}"
  location            = "{{location}}"
  address_space       = {{safeArray address_space}}

{{#if tags}}
  tags = {{{tags}}}
{{/if}}
}
