variable "service_account_name" {
  type        = string
  default     = ""
  description = "The service account name"
}

variable "project_id" {
  type        = string
  default     = ""
  description = "A project ID different from the default defined inside the provider"
}

variable "create" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}
