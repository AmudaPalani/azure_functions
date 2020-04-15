terraform {
  # backend "azurerm" {}
}

provider "azurerm" {
  version = "~>2.0"
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "dcerg" {
  name     = "dce-${var.environment}"
  location = var.location
  tags = {
    environment = var.environment
    application = "dce"
    provisioner = "terraform"
  }
}
