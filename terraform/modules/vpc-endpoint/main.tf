resource "aws_vpc_endpoint" "cloudwatch_logs" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.az}.logs"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    var.dev_subnet_id,
    var.prod_subnet_id
  ]

  security_group_ids = [
    var.endpoint_sg_id
  ]

  private_dns_enabled = true

  tags = {
    Name = "cloudwatch-logs-endpoint"
  }
}

resource "aws_vpc_endpoint" "cloudwatch_monitoring" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.az}.monitoring"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    var.dev_subnet_id,
    var.prod_subnet_id
  ]

  security_group_ids = [
    var.endpoint_sg_id
  ]

  private_dns_enabled = true

  tags = {
    Name = "cloudwatch-monitoring-endpoint"
  }
}
