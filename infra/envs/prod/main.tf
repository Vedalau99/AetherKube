
# Production environment - assembles modules for AetherKube


# Resource Group
module "rg" {
  source = "../../modules/resource-group"

  name     = var.rg_name
  location = var.location
}


# Network (VNet, subnets)
module "network" {
  source   = "../../modules/network"

  vnet_name     = var.vnet_name
  rg_name       = module.rg.name
  location      = var.location
  address_space = var.address_space

  aks_subnet = var.aks_subnet
  app_subnet = var.app_subnet
}


# ACR
module "acr" {
  source   = "../../modules/acr"
  
  name     = var.acr_name
  rg_name  = module.rg.name
  location = var.location
}

# AKS
module "aks" {
  source = "../../modules/aks"

  name          = var.aks_name
  location      = var.location
  rg_name       = var.rg_name
  subnet_id     = module.network.aks_subnet_id

  node_count    = var.aks_node_count
  vm_size       = var.aks_vm_size

  service_cidr   = var.service_cidr
  dns_service_ip = var.dns_service_ip
}

# Grant AKS identity pull access to ACR (IAM)
module "iam" {
  source     = "../../modules/iam"
  principal_id = module.aks.principal_id
  acr_id       = module.acr.id
}

# Monitoring (Log Analytics + diagnostic settings)

module "monitoring" {
  source      = "../../modules/monitoring"
  name        = var.monitoring_name
  location    = var.location
  rg_name     = var.rg_name
  aks_id      = module.aks.aks_id
}

