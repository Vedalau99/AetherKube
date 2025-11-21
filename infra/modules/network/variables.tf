variable "vnet_name" {}
variable "location" {}
variable "rg_name" {}
variable "address_space" {
  type = list(string)
}
variable "aks_subnet" {
  type = list(string)
}
variable "app_subnet" {
  type = list(string)
}
