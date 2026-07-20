resource "aws_instance" "private_dev_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.dev_subnet_id
  key_name               = var.key_name_dev
  vpc_security_group_ids = [var.security_group_id]
  user_data = file("${path.module}/user-data/cloudwatch-agent.sh")

  associate_public_ip_address = false

  tags = {
    Name = "private-dev-instance"
    Environment = "dev"
  }
}

resource "aws_instance" "prod" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.prod_subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name_prod
  user_data = file("${path.module}/user-data/cloudwatch-agent.sh")

  associate_public_ip_address = false

  tags = {
    Name        = "prod-server"
    Environment = "prod"
  }
}
