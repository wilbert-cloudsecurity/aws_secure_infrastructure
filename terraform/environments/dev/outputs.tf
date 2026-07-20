output "bastion_public_ip" {
  value       = module.bastion.bastion_public_ip
}

output "dev_instance_private_ip" {
  value       = module.ec2.dev_instance_ip
}

output "prod_instance_private_ip" {
  value       = module.ec2.prod_instance_ip
}
