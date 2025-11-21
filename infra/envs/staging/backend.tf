terraform {
  backend "azurerm" {
    resource_group_name  = "aetherkube-tfstate-rg"
    storage_account_name = "aetherkubetfstatenew001"
    container_name       = "tfstate"
    key                  = "staging.terraform.tfstate"
  }
}
