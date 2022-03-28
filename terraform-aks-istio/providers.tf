terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-AZ-STORAGE_ACC"
    storage_account_name = "terraform0003"
    container_name       = "tfstate"
    key                  = "RK6KqhoK71JLDeRqR+1vDkrkwe/7WLMu+l0dfjYwvgFRQARPEUUNWQNiLJwsaycvP/ez1cHXozx1MA293cgRtQ=="
  }
}

provider "azurerm" {
  features {}
}
