resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name_prefix}-aks-service"
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "aksvnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.virtual_network_address_prefix]
  #dns_servers         = var.dns_servers

  subnet {
    name           = var.aks_subnet_name
    address_prefix = var.aks_subnet_address_prefix
  }

  tags = {
    Environment = "Production"
    Owner       = "Vanguadia"
  }
}

data "azurerm_subnet" "kubesubnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  depends_on           = [azurerm_virtual_network.aksvnet]
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = var.aks_dns_prefix
  node_resource_group = var.node_rg_aks
  resource_group_name = azurerm_resource_group.rg.name

  http_application_routing_enabled = false

  private_cluster_enabled = true

  kubernetes_version = var.kubernetes_version

  sku_tier = "Paid"

  default_node_pool {
    name            = "platform"
    node_count      = var.aks_agent_count
    vm_size         = var.aks_agent_vm_size
    os_disk_size_gb = var.aks_agent_os_disk_size
    vnet_subnet_id  = data.azurerm_subnet.kubesubnet.id

  }

  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
    load_balancer_sku  = "Standard"
  }

  role_based_access_control_enabled = false


  tags = {
    Environment = "Production"
    Owner       = "Vanguadia"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "msnodeprd1" {
  name                  = "msnodeprd1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  vm_size               = var.aks_agent_vm_size
  node_count            = var.aks_agent_count
  os_disk_size_gb       = var.aks_agent_os_disk_size
  node_labels           = { "microservice" = "dev" }
  node_taints           = ["micros=dev:NoSchedule"]
  mode                  = "User"
  max_pods              = 200
  os_type               = "Linux"
  vnet_subnet_id        = data.azurerm_subnet.kubesubnet.id
  #availability_zones    = ["1", "3"]
  #availability_zones = ["1"]

}

resource "azurerm_kubernetes_cluster_node_pool" "msnodeprd2" {
  name                  = "msnodeprd2"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  vm_size               = var.aks_agent_vm_size
  node_count            = var.aks_agent_count
  os_disk_size_gb       = var.aks_agent_os_disk_size
  node_labels           = { "microservice" = "dev" }
  node_taints           = ["micros=dev:NoSchedule"]
  mode                  = "User"
  max_pods              = 200
  os_type               = "Linux"
  vnet_subnet_id        = data.azurerm_subnet.kubesubnet.id
  #availability_zones    = ["1", "3"]
  #availability_zones = ["1"]

}