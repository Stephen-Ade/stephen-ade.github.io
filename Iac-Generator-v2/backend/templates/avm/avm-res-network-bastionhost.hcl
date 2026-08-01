terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-bastionhost" {
  source  = "Azure/avm-res-network-bastionhost/azurerm"
  version = "x.x.x" # Version pinned by update-tf-modules.js

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
