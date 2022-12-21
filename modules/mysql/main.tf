variable "name" {
  description = "Name of the MySQL database."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to deploy the MySQL Database into."
  type        = string
}

resource "null_resource" "mysql" {
  triggers = {
    name   = var.name
    vpc_id = var.vpc_id
  }
}

output "fqdn" {
  value = null_resource.mysql.id
}
