variable "automation_account_name" {
  description = "Name of the Azure Automation Account."
  type        = string
}

variable "location" {
  description = "Azure region for resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace."
  type        = string
}

variable "retention_in_days" {
  description = "Retention period for Log Analytics Workspace."
  type        = number
  default     = 30
}

variable "start_time" {
  description = "Start time for the weekly patch schedule (ISO 8601 format)."
  type        = string
}