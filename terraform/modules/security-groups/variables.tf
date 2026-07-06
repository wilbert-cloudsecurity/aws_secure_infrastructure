variable "vpc_id" {
  description = "VPC ID for security groups"
  type        = string
}

variable "my_ip" {
  description = "Allowed public IP for SSH access"
  type        = string
}
