resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

module "automation_account" {
  source              = "./modules/automation_account"
  resource_group_name = azurerm_resource_group.example.name
}

module "log_analytics_workspace" {
  source              = "./modules/log_analytics_workspace"
  resource_group_name = azurerm_resource_group.example.name
}

module "update_management" {
  source              = "./modules/update_management"
  resource_group_name = azurerm_resource_group.example.name
  automation_account_id = module.automation_account.id
  log_analytics_workspace_id = module.log_analytics_workspace.id
}

resource "azurerm_virtual_machine" "example" {
  name                  = "example-vm"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size              = "Standard_DS1_v2"

  storage_os_disk {
    name              = "example-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_update_management" "example" {
  virtual_machine_id = azurerm_virtual_machine.example.id
  schedule {
    frequency = "Weekly"
    time      = "2023-10-01T00:00:00Z"
  }
}