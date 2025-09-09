

resource "azurerm_update_management" "weekly_patch_schedule" {
  automation_account_id = azurerm_automation_account.assignment2.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.assignment2.id

  schedule {
    frequency = "Weekly"
    interval  = 1
    time      = "2025-09-09T00:00:00Z" # Example start time
  }

  virtual_machine_ids = [
    azurerm_virtual_machine.assignment2.id
  ]
}

resource "azurerm_virtual_machine" "assignment2" {
  name                  = "assignment2-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.assignment2.id]
  vm_size              = "Standard_DS1_v2"
  availability_set_id   = azurerm_availability_set.assignment2.id

  os_profile {
    computer_name  = "hostname"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "assignment2-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  # Additional configurations for the VM can be added here
}