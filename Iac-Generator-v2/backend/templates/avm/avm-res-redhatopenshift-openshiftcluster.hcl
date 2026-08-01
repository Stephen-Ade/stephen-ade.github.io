terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "avm-res-redhatopenshift-openshiftcluster" {
  source  = "Azure/avm-res-redhatopenshift-openshiftcluster/azurerm"
  version = "x.x.x" # Version pinned by update-tf-modules.js

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
