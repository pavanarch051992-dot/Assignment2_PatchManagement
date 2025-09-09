resource "azurerm_resource_group" "main" {
  name     = "patch-management-rg"
  location = "East US"
}

module "log_analytics_workspace" {
  source               = ".//modules/log_analytics_workspace"
  workspace_name       = "patch-management-law"
  resource_group_name  = azurerm_log_analytics_workspace.example.resource_group_name
  location             = azurerm_log_analytics_workspace.example.location
}

module "automation_account" {
  source                      = ".//modules/automation_account"
  log_analytics_workspace_name = module.log_analytics_workspace.workspace_name
  automation_account_name      = "patch-management-aa"
  resource_group_name          = azurerm_resource_group.main.name
  tags                         = {
    environment = "production"
    project     = "patch-management"
  }
  retention_in_days            = 30
  start_time                   = "2024-06-01T00:00:00Z"
  location                     = azurerm_resource_group.main.location
}

module "update_management" {
  source  = "../modules/update_management"

  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  automation_account_name      = module.automation_account.name
  log_analytics_workspace_id   = module.log_analytics_workspace.id
  admin_username                = module.update_management.assignment2.admin_username
  admin_password                = module.update_management.assignment2.admin_password
}

output "automation_account_id" {
  value = module.automation_account.id
}

output "log_analytics_workspace_id" {
  value = module.log_analytics_workspace.id
}

output "update_management_id" {
  value = module.update_management.id
}