resource "aws_cloudwatch_log_group" "ec2_logs" {
  name              = "/aws/ec2/private-instances"
  retention_in_days = 7

  tags = {
    Name = "ec2-log-group"
  }
}
