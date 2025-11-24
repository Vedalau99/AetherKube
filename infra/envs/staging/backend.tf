
terraform {
  backend "azurerm" {
    resource_group_name  = "aetherkube-stg-tfstate-rg"
    storage_account_name = "aetherkubestgstate"
    container_name       = "tfstate"
    key                  = "staging.terraform.tfstate"
  }
}
