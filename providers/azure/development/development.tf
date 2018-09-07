variable "resource_group_name" { }
variable "location" { }

data "vault_generic_secret" "azure_provider" {
  path = "secret/azure_provider"
}

provider "azurerm" {
    subscription_id = "${data.vault_generic_secret.azure_provider.data["subscription_id"]}"
    client_id       = "${data.vault_generic_secret.azure_provider.data["client_id"]}"
    client_secret   = "${data.vault_generic_secret.azure_provider.data["client_secret"]}"
    tenant_id       = "${data.vault_generic_secret.azure_provider.data["tenant_id"]}"
}
