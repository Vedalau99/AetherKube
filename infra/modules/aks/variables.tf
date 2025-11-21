variable "name" {}
variable "location" {}
variable "rg_name" {}

variable "node_count" {
  type    = number
  default = 1
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "subnet_id" {}
