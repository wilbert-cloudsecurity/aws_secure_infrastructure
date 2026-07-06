variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group_id" {
  description = "Security group ID for bastion host"
  type        = string
}
