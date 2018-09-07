# Azure Storage
terraform {
  backend "azurerm" {
   storage_account_name = "oiradaichi"
   container_name       = "oisix"
   key                  = "oisix.terraform.tfstate"
   access_key           = "XXXXXXXXXXXXXX"
  }
}
