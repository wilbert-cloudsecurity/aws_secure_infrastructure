output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}
 
output "private_instance_sg_id" {
  value = aws_security_group.private_instance_sg.id
}

