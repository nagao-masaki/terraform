data "vault_generic_secret" "azure_provider" {
  path = "secret/azure_provider"
}

provider "azurerm" {
    subscription_id = "${data.vault_generic_secret.azure_provider.data["subscription_id"]}"
    client_id       = "${data.vault_generic_secret.azure_provider.data["client_id"]}"
    client_secret   = "${data.vault_generic_secret.azure_provider.data["client_secret"]}"
    tenant_id       = "${data.vault_generic_secret.azure_provider.data["tenant_id"]}"
}


#------------------------------------------------
# kubernetes
#------------------------------------------------
#module "kubernetes" {
#  source = "../../../modules/azure/kubernetes"
#
#  name            = "${var.name}"
#  vpc_cidr        = "${var.vpc_cidr}"
#  region          = "${var.region}"
#  azs             = "${var.azs}"
#  private_subnets = "${var.private_subnets}"
#  public_subnets  = "${var.public_subnets}"
#  domain_name     = "${var.domain_name}"
#}
#
