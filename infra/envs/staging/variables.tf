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

# Backend
variable "tfstate_resource_group_name" {
  type = string
}

variable "tfstate_storage_account_name" {
  type = string
}

variable "tfstate_container_name" {
  type = string
}

# Resource group
variable "rg_name" {
  type = string
}

# Network
variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "aks_subnet" {
  type = list(string)
}

variable "app_subnet" {
  type = list(string)
}

# ACR
variable "acr_name" {
  type = string
}

# AKS
variable "aks_name" {
  type = string
}

variable "aks_node_count" {
  type = number
}

variable "aks_vm_size" {
  type = string
}

# Monitoring
variable "monitoring_name" {
  type = string
}

# Newly added — REQUIRED for AKS networking
variable "service_cidr" {
  type = string
}

variable "dns_service_ip" {
  type = string
}
