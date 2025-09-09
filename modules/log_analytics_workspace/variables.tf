variable "workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
  default     = "default-law"
}

variable "location" {
  description = "The Azure region where the Log Analytics Workspace will be created."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Log Analytics Workspace will be created."
  type        = string
  default     = "default-resource-group"
}

variable "retention_in_days" {
  description = "The number of days to retain data in the Log Analytics Workspace."
  type        = number
  default     = 30
}

variable "tags" {
  description = "A mapping of tags to assign to the Log Analytics Workspace."
  type        = map(string)
  default     = {
    Environment = "dev"
    Owner       = "admin"
  }
}