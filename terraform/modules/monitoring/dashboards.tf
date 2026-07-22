resource "aws_cloudwatch_dashboard" "dev_dashboard" {
  dashboard_name = "dev-instance-dashboard"

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

resource "aws_cloudwatch_dashboard" "prod_dashboard" {
  dashboard_name = "prod-instance-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"

        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "prod_InstanceId", var.prod_instance_id]
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
