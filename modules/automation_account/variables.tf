variable "automation_account_name" {
  description = "The name of the Automation Account."
  type        = string
  default     = "pavan-automation-account"
}

variable "location" {
  description = "The Azure location for resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "pavan-resource-group"
}

variable "tags" {
  description = "A mapping of tags to assign to resources."
  type        = map(string)
  default     = {
    Environment = "dev"
    Owner       = "admin"
  }
}

