variable "name" {}
variable "location" {}
variable "rg_name" {}

variable "node_count" {
  type    = number
  default = 1
}

variable "vm_size" {
  type    = string
  default = "standard_dc16s_v3"
}

variable "subnet_id" {}

variable "service_cidr" {
  type = string
  default = "10.3.0.0/16"
}

variable "dns_service_ip" {
  type = string
  default = "10.3.0.10"
}

