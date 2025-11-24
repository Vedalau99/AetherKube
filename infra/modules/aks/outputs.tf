output "kube_admin_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
  sensitive = true
}

output "principal_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}
