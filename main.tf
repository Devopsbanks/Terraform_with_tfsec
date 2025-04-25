terraform {
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.24.0"
    }
  }
}

provider "" {
    features {}
    subscription_id = "9117002a-2308-428d-993b-9f46dfdfd10c"
}

resource "azurerm_resource_group" "Rg_block" {
  name     = "rg-block"
  location = "East US"
  
}