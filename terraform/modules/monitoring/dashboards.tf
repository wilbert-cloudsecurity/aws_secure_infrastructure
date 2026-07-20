resource "aws_cloudwatch_dashboard" "main_dashboard" {
  dashboard_name = "infrastructure-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"

        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "dev_InstanceId", var.dev_instance_id]
          ]

          period = 300
          stat   = "Average"
          region = "us-east-1"

          title = "EC2 CPU Utilization"
        }
      }
    ]
  })
}
