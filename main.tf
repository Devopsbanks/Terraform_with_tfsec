terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.24.0"
    }
  }
  /* backend "azurerm" {
    resource_group_name  = "infra-rg"
    storage_account_name = "mystorageaccount"
    container_name       = "mycontainer"
    key                  = "terraform.tfstate"

  }
  */
}


provider "azurerm" {
  features {}
  subscription_id = "your_azure_subscription_id"
}

resource "azurerm_resource_group" "Rg_block" {
  name     = "infra-rg"
  location = "East US"

}

resource "azurerm_storage_account" "storage_account" {
  name                     = "mystorageaccount"
  resource_group_name      = azurerm_resource_group.Rg_block.name
  location                 = azurerm_resource_group.Rg_block.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [azurerm_resource_group.Rg_block]
}
resource "azurerm_storage_container" "container" {
  name                  = "mycontainer"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storage_account]
}
