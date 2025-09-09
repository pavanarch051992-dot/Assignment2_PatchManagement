resource "azurerm_log_analytics_workspace" "example" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  retention_in_days = var.retention_in_days

  tags = var.tags
}
output "id" {
  value = azurerm_log_analytics_workspace.example.id
}

