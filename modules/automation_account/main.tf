resource "azurerm_automation_account" "example" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Basic"
  tags                = var.tags
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}

resource "azurerm_automation_schedule" "weekly_patch_schedule" {
  name                = "WeeklyPatchSchedule"
  resource_group_name = var.resource_group_name
  automation_account_name = azurerm_automation_account.example.name
  frequency           = "Week"
  interval            = 1
  start_time          = var.start_time
}

resource "azurerm_automation_update_management" "example" {
  automation_account_name = azurerm_automation_account.example.name
  resource_group_name     = var.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
}