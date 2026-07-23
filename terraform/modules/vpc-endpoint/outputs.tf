output "cloudwatch_logs_endpoint_id" {
  value = aws_vpc_endpoint.cloudwatch_logs.id
}

output "cloudwatch_monitoring_endpoint_id" {
  value = aws_vpc_endpoint.cloudwatch_monitoring.id
}
