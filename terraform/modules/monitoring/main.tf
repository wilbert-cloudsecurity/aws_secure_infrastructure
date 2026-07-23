resource "aws_cloudwatch_log_group" "instances_logs" {
  name              = "/aws/ec2/private-instances"
  retention_in_days = 7

  tags = {
    Name = "instances-log-group"
  }
}


