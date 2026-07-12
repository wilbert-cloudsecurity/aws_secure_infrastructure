output "private_instance_ip" {
  value       = aws_instance.private_instance.private_ip
}

output "instance_id" {
  value       = aws_instance.private_instance.id
}
