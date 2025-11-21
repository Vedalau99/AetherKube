terraform {
  backend "azurerm" {
    resource_group_name  = "rg-aetherkube-tfstate"
    storage_account_name = "aetherkubetfstate"
    container_name       = "tfstate"
    key                  = "prod.tfstate"
  }
}
