variable "resource_group_name" {
  description = "The prefix used for all resources in this example"
  default     = "rg-aks-service"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default = "eastus2"
}

variable "acr_name" {
  description = "The prefix used for all resources in this example"
  default     = "acreastus2prod"
}
