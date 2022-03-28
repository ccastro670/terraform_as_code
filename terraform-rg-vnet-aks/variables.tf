variable "resource_group_name" {
  default     = "rg-aks-service"
  description = "Name azure Resource group for aks."
}

variable "location" {
  default     = "eastus2"
  description = "Location of the resources."
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
