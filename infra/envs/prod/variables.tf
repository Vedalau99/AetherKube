# Azure Authentication 

variable "subscription_id" {
  description = "Azure Subscription ID for the prod environment"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

# General Settings

variable "location" {
  description = "Azure region for production deployment"
  type        = string
}

# Terraform Backend

variable "resource_group_name" {
  description = "Resource group that contains Terraform backend storage"
  type        = string
}

variable "tfstate_storage_account_name" {
  description = "Storage account name for Terraform state"
  type        = string
}

variable "tfstate_container_name" {
  description = "Blob container name for Terraform state"
  type        = string
}

# Resource Group + Networking

variable "rg_name" {
  description = "Name of the production resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the production Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space of the production VNet"
  type        = list(string)
}

variable "aks_subnet" {
  description = "AKS subnet CIDR list"
  type        = list(string)
}

variable "app_subnet" {
  description = "App subnet CIDR list"
  type        = list(string)
}

# ACR

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}

# AKS Cluster

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
}

variable "aks_node_count" {
  description = "Number of nodes in the prod AKS cluster"
  type        = number
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}

# Monitoring

variable "monitoring_name" {
  description = "Name of monitoring resource (Log Analytics / Insights)"
  type        = string
}

# AKS Networking (Service CIDR, DNS)

variable "service_cidr" {
  description = "AKS service CIDR"
  type        = string
}

variable "dns_service_ip" {
  description = "AKS DNS service IP"
  type        = string
}
