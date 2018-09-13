variable "cluster_name" { }
variable "dns_prefix" { }
variable "agent_count" { }
variable "ssh_public_key" { }
variable "resource_group_name" { }
variable "location" { }

resource "azurerm_resource_group" "oisix-aks-dev" {
    name     = "${var.resource_group_name}"
    location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "oisix-aks-dev" {
  name                = "${var.cluster_name}"
  location            = "${azurerm_resource_group.oisix-aks-dev.location}"
  resource_group_name = "${azurerm_resource_group.oisix-aks-dev.name}"
  dns_prefix          = "${var.dns_prefix}"

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = "${file("${var.ssh_public_key}")}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = "${var.agent_count}"
    vm_size         = "Standard_D2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id       = "${data.vault_generic_secret.azure_provider.data["client_id"]}"
    client_secret   = "${data.vault_generic_secret.azure_provider.data["client_secret"]}"
  }

  tags {
    Environment = "Development"
  }
}

output "client_key" {
    value = "${azurerm_kubernetes_cluster.oisix-aks-dev.kube_config.0.client_key}"
}

output "client_certificate" {
    value = "${azurerm_kubernetes_cluster.oisix-aks-dev.kube_config.0.client_certificate}"
}

output "cluster_ca_certificate" {
    value = "${azurerm_kubernetes_cluster.oisix-aks-dev.kube_config.0.cluster_ca_certificate}"
}

output "cluster_username" {
    value = "${azurerm_kubernetes_cluster.oisix-aks-dev.kube_config.0.username}"
}

output "cluster_password" {
    value = "${azurerm_kubernetes_cluster.oisix-aks-dev.kube_config.0.password}"
}

output "kube_config" {
    value = "${azurerm_kubernetes_cluster.oisix-aks-dev.kube_config_raw}"
}

output "host" {
    value = "${azurerm_kubernetes_cluster.oisix-aks-dev.kube_config.0.host}"
}
