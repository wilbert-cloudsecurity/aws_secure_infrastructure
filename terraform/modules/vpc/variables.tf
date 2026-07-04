variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_dev_subnet_cidr" {
  type = string
}

variable "private_prod_subnet_cidr" {
  type = string
}

variable "az" {
  description = "Availability zone"
  type        = string
}
