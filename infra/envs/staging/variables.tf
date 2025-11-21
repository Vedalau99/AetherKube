variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "tfstate_resource_group_name" {
  type = string
}

variable "tfstate_storage_account_name" {
  type = string
}

variable "tfstate_container_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "aks_subnet" {
  type = list(string) # IMPORTANT: must be a list
}

variable "app_subnet" {
  type = list(string) # IMPORTANT: must be a list
}

variable "acr_name" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "aks_node_count" {
  type = number
}

variable "aks_vm_size" {
  type = string
}

variable "monitoring_name" {
  type = string
}
