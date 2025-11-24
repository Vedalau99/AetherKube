resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.name}-dns"

  default_node_pool {
    name            = "system"
    vm_size         = var.vm_size  # Should be Standard_B1s
    node_count      = var.node_count
    vnet_subnet_id  = var.subnet_id

    upgrade_settings {
      max_surge = "1"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    load_balancer_sku   = "standard"

    # Non-overlapping safe CIDRs
    service_cidr        = "10.3.0.0/16"
    dns_service_ip      = "10.3.0.10"
  }
}

