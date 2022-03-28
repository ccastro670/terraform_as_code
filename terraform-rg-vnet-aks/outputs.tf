output "vnet" {
  value = azurerm_virtual_network.aksvnet.name
}

output "address_space_vnet" {
  value = azurerm_virtual_network.aksvnet.address_space
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
}
