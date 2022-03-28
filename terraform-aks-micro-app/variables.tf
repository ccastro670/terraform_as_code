variable "resource_group_name" {
  default     = "rg-aks-service"
  description = "Name azure Resource group for aks."
}

variable "location" {
  default     = "eastus2"
  description = "Location of the resources."
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

variable "aks_subnet_name" {
  description = "Subnet Name."
  default     = "microapp-subnet"
}

variable "aks_subnet_address_prefix" {
  description = "Subnet address prefix."
  default     = ["192.168.0.0/19"]
}

variable "aks_name" {
  description = "AKS cluster name"
  default     = "aks-microapp"
}

variable "node_rg_aks" {
  description = "Resource Group name Node AKS"
  default     = "rg-aks-node-microapp"
}

variable "aks_dns_prefix" {
  description = "Optional DNS prefix to use with hosted Kubernetes API server FQDN."
  default     = "aks-microapp"
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
  default     = "10.11.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "DNS server IP address"
  default     = "10.11.0.10"
}

variable "aks_docker_bridge_cidr" {
  description = "CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}

