resource "aws_cloudwatch_log_group" "dev_logs" {
  name              = "/aws/ec2/dev-instance"
  retention_in_days = 7

  tags = {
    Name = "dev-log-group"
  }
}

resource "aws_cloudwatch_log_group" "prod_logs" {
  name              = "/aws/ec2/prod-instance"
  retention_in_days = 7

  tags = {
    Name = "prod-log-group"
  }
}
