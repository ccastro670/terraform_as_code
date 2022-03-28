resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "aksvnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network_address_prefix]
  #dns_servers         = var.dns_servers
  depends_on           = [azurerm_resource_group.rg]

  tags = {
    Environment = "Production"
    Owner       = "Vanguadia"
  }
}

