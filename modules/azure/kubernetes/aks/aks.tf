variable "azure_client_id" { }
variable "azure_client_secret" { }
variable "aks_cluster_name" { }
variable "aks_dns_prefix" { }
variable "aks_agent_count" { }
variable "aks_vm_size" { }
variable "aks_os_type" { }
variable "aks_os_disk_size_gb" { }
variable "aks_ssh_public_key" { }
variable "aks_linux_profile" { }


resource "azurerm_kubernetes_cluster" "oisix_aks_dev" {
  name                = "${var.aks_cluster_name}"
  location            = "${azurerm_resource_group.oisix_aks_dev.location}"
  resource_group_name = "${azurerm_resource_group.oisix_aks_dev.name}"
  dns_prefix          = "${var.aks_dns_prefix}"

  linux_profile {
    admin_username = "${var.aks_linux_profile}"

    ssh_key {
      key_data = "${file("${var.aks_ssh_public_key}")}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = "${var.aks_gent_count}"
    vm_size         = "${var.aks_vm_size}"
    os_type         = "${var.aks_os_type}"
    os_disk_size_gb = "${var.aks_os_disk_size_gb}"
  }

  service_principal {
    client_id       = "${var.azure_client_id}"
    client_secret   = "${var.azure_client_secret}"
  }

  tags {
    Environment = "Development"
  }
}

output "client_key" {
    value = "${azurerm_kubernetes_cluster.oisix_aks_dev.kube_config.0.client_key}"
}

output "client_certificate" {
    value = "${azurerm_kubernetes_cluster.oisix_aks_dev.kube_config.0.client_certificate}"
}

output "cluster_ca_certificate" {
    value = "${azurerm_kubernetes_cluster.oisix_aks_dev.kube_config.0.cluster_ca_certificate}"
}

output "cluster_username" {
    value = "${azurerm_kubernetes_cluster.oisix_aks_dev.kube_config.0.username}"
}

output "cluster_password" {
    value = "${azurerm_kubernetes_cluster.oisix_aks_dev.kube_config.0.password}"
}

output "kube_config" {
    value = "${azurerm_kubernetes_cluster.oisix_aks_dev.kube_config_raw}"
}

output "host" {
    value = "${azurerm_kubernetes_cluster.oisix_aks_dev.kube_config.0.host}"
}
