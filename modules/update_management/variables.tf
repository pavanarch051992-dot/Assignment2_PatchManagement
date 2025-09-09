variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  sensitive   = true
  default     = "P@ssw0rd1234!"
}

variable "location" {
  description = "Azure region for resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "default-resource"
}