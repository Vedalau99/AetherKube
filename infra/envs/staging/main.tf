
# Staging environment - assembles modules for AetherKube


# backend module
module "tf_backend" {
  source = "../../modules/tf-backend"

  resource_group_name  = var.tfstate_resource_group_name
  location             = var.location
  storage_account_name = var.tfstate_storage_account_name
  container_name       = var.tfstate_container_name
}

# resource group for the actual staging infra
module "resource_group" {
  source   = "../../modules/resource-group"
  name     = var.rg_name
  location = var.location
}

# network: VNet + subnets
module "network" {
  source       = "../../modules/network"
  vnet_name    = var.vnet_name
  location     = var.location
  rg_name      = module.resource_group.name
  address_space = var.address_space
  aks_subnet   = var.aks_subnet
  app_subnet   = var.app_subnet
}

# Azure Container Registry (ACR)
module "acr" {
  source       = "../../modules/acr"
  name         = var.acr_name
  location     = var.location
  rg_name      = module.resource_group.name
}

# AKS cluster
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
  source   = "../../modules/monitoring"
  name     = var.monitoring_name
  location = var.location
  rg_name  = module.resource_group.name
  aks_id   = module.aks.kube_admin_config != null ? module.aks.kube_admin_config : ""
}

