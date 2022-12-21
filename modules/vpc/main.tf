variable "name" {
  description = "Name of the VPC."
  type        = string
}

variable "cidr_block" {
  description = "The IPv4 CIDR block to allocate for the VPC network."
  type        = string
}

resource "null_resource" "vpc" {
  triggers = {
    name       = var.name
    cidr_block = var.cidr_block
  }
}

output "vpc_id" {
  value = null_resource.vpc.id
}
