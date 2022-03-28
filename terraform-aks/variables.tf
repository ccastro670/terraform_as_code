variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default     = "eastus2"
  description = "Location of the resource group."
}

variable "aks_service_principal_app_id" {
  description = "Application ID/Client ID  of the service principal. Used by AKS to manage AKS related resources on Azure like vms, subnets."
}

variable "aks_service_principal_client_secret" {
  description = "Secret of the service principal. Used by AKS to manage Azure."
}

variable "aks_service_principal_object_id" {
  description = "Object ID of the service principal."
}

variable "virtual_network_name" {
  description = "Virtual network name"
  default     = "aksVirtualNetwork"
}

variable "virtual_network_address_prefix" {
  description = "VNET address prefix"
  default     = "192.168.0.0/16"
}

#variable "dns_servers" {
#  description = "The DNS servers to be used with vNet"
#  default     = ["192.168.40.7", "192.168.40.8"]
#}

variable "aks_subnet_name" {
  description = "Subnet Name."
  default     = "kubesubnet"
}

variable "aks_subnet_address_prefix" {
  description = "Subnet address prefix."
  default     = "192.168.0.0/19"
}

variable "aks_name" {
  description = "AKS cluster name"
  default     = "aks-cluster1"
}

variable "node_rg_aks" {
  description = "Resource Group name Node AKS"
  default     = "rg-aks-node-platform"
}

variable "aks_dns_prefix" {
  description = "Optional DNS prefix to use with hosted Kubernetes API server FQDN."
  default     = "aks"
}

variable "aks_agent_os_disk_size" {
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize."
  default     = 40
}

variable "aks_agent_count" {
  description = "The number of agent nodes for the cluster."
  default     = 1
}

variable "aks_agent_vm_size" {
  description = "VM size"
  default     = "Standard_DS2"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  default     = "1.22.4"
}

variable "aks_service_cidr" {
  description = "CIDR notation IP range from which to assign service cluster IPs"
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "DNS server IP address"
  default     = "10.0.0.10"
}

variable "aks_docker_bridge_cidr" {
  description = "CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}

