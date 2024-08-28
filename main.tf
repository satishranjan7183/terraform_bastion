terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "8a792a96-9bd0-41cd-bb14-cbed745e3244"
}

resource "azurerm_resource_group" "satrg" {
  name     = "satrg1"
  location = "canada central"

}

resource "azurerm_storage_account" "satstr12" {
  name= "sastr1"
  location = "canada central"
  resource_group_name = "satrg1"
  account_replication_type = "LRS"
  account_tier = "Standard"
  
}