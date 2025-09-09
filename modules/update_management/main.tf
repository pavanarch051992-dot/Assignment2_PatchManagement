

resource "azurerm_update_management" "example" {
  automation_account_id = azurerm_automation_account.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  schedule {
    frequency = "Weekly"
    interval  = 1
    time      = "2023-10-01T00:00:00Z" # Adjust the time as needed
  }

  virtual_machine_ids = [
    azurerm_virtual_machine.example.id
  ]
}

resource "azurerm_virtual_machine" "example" {
  name                  = "example-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size              = "Standard_DS1_v2"
  availability_set_id   = azurerm_availability_set.example.id

  os_profile {
    computer_name  = "hostname"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  # Additional configurations for the VM can be added here
}