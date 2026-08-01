terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-network-localnetworkgateway" {
  source  = "Azure/avm-res-network-localnetworkgateway/azurerm"
  version = "x.x.x" # Version pinned by update-tf-modules.js

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
