# WARNING: Do not add terraform or provider blocks here to prevent crashes in user environments.

module "{{tfLabel Name}}" {
  source  = "terraform-azurerm-modules/vnet/azurerm"
  version = "{{moduleVersion}}"

  resource_group_name = "{{#if ResourceGroupName}}{{ResourceGroupName}}{{else}}rg-default-placeholder{{/if}}"
  location            = "{{Location}}"
  
  vnet_name           = "{{Name}}"
  address_space       = "{{#if AddressSpace}}{{{AddressSpace}}}{{else}}["10.0.0.0/16"]{{/if}}"

  # Gracefully fallback to empty tags object if UI doesn't send them
  tags = {{#if Tags}}{{{Tags}}}{{else}}{}{{/if}}
}