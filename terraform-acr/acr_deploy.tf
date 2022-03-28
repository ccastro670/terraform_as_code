resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = true
  zone_redundancy_enabled = true
  retention_policy {
    days    = "10"
    enabled = "true"
  }
  tags = {
    Environment = "Production"
    Owner       = "Vanguadia"
  }
}
