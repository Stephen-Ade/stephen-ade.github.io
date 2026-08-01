terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-desktopvirtualization-hostpool" {
  source  = "Azure/avm-res-desktopvirtualization-hostpool/azurerm"
  version = "x.x.x" # Version pinned by update-tf-modules.js

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
