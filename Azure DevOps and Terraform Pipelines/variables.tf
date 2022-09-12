
variable "bkstrgkey" {
  type = string
  description = "The access key for the storage account"
  default = "<storage account key>"
}

variable "resourcegroup_name" {
  type        = string
  description = "The name of the resource group"
  default     = "<resource group name>"
}

variable "location" {
  type        = string
  description = "The region for the deployment"
  default     = "<region>"
}
