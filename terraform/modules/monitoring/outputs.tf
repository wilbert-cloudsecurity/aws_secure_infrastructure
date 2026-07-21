output "dev_log_group_name" {
  value = aws_cloudwatch_log_group.dev_logs.name
}

output "prod_log_group_name" {
  value = aws_cloudwatch_log_group.prod_logs.name
}
