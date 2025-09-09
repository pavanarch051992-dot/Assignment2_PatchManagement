variable "automation_account_name" {
  description = "The name of the Automation Account."
  type        = string
}

variable "location" {
  description = "The Azure location for resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to resources."
  type        = map(string)
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "retention_in_days" {
  description = "Retention period for Log Analytics Workspace."
  type        = number
}

variable "start_time" {
  description = "Start time for the automation schedule."
  type        = string
}