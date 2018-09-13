variable "resource_group_name" { }
variable "location" { }

module "resource-group" {
  source = "./resource-group"

  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
}

module "aks" {
  source = "./aks"

  name = "${var.name}-vpc"
  cidr = "${var.vpc_cidr}"
}
