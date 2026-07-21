resource "aws_cloudwatch_metric_alarm" "dev_instance_high_cpu" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2

  metric_name = "CPUUtilization"
  namespace   = "AWS/EC2"

  period    = 300
  statistic = "Average"

  threshold = 70

  alarm_description = "Alarm when CPU exceeds 70%"

  dimensions = {
    dev_InstanceId = var.dev_instance_id
  }
}

resource "aws_cloudwatch_metric_alarm" "prod_instance_high_cpu" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2

  metric_name = "CPUUtilization"
  namespace   = "AWS/EC2"

  period    = 300
  statistic = "Average"

  threshold = 70

  alarm_description = "Alarm when CPU exceeds 70%"

  dimensions = {
    dev_InstanceId = var.prod_instance_id
  }
}
