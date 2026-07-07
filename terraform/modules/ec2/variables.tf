variable "ami_id" {
  type        = string
  description = "The AMI ID to use for the EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "The size/type of the EC2 instance (e.g., t3.micro)"
  default     = "t3.micro"
}

variable "private_subnet_id" {
  type        = string
  description = "The ID of the private subnet where the EC2 instance will be deployed"
}

variable "key_name" {
  type        = string
  description = "The name of the SSH Key Pair to inject into the instance"
}

variable "security_group_id" {
  type        = string
  description = "The ID of the Security Group to associate with the EC2 instance"
}
