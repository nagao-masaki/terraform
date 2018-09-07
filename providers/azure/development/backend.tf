# Azure Storage
terraform {
  backend "azurerm" {
   storage_account_name = "oiradaichi"
   container_name       = "oiradaichi"
   key                  = "oiradaichi.terraform.tfstate"
   access_key           = "XXXXXXXXXXXXXX"
  }
}
