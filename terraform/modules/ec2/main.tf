resource "aws_instance" "private_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  user_data = file("${path.module}/user-data/cloudwatch-agent.sh")

  associate_public_ip_address = false

  tags = {
    Name = "private-dev-instance"
  }
}
