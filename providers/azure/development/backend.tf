# Azure Storage
terraform {
  backend "azurerm" {
   storage_account_name = "oiradaichi"
   container_name       = "oisix"
   key                  = "oisix.terraform.tfstate"
   access_key           = "FSnSSml2Rm9R1c/STBpJb3UFnjuFZseXpzo5fcumVL9yN7vwAAMX+RE9PCrlwHu6Ugx9/p9slFOAkmbNja8F+w=="
  }
}
