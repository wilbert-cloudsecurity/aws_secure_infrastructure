output "dev_instance_ip" {
  value       = aws_instance.private_dev_instance.private_ip
}

output "dev_instance_id" {
  value       = aws_instance.private_dev_instance.id
}

output "prod_instance_ip" {
  value       = aws_instance.prod.private_ip
}
