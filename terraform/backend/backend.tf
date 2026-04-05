terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateflask12345"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}