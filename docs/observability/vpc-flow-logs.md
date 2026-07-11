# VPC Flow Logs: Network Observability

## What are they?
VPC Flow Logs is an AWS feature that captures information about the IP traffic going to and from network interfaces (ENI) in your VPC. Flow log data is published to Amazon CloudWatch Logs, enabling real-time analysis and auditing.

## Why do they matter?
They are essential for both security and troubleshooting. Without them, a VPC acts as a "black box" where you cannot visualize network-level communications, making it extremely difficult to detect security breaches or misconfigurations.

## Visibility Added
* **Flow Analysis:** Identify which resources (instances, load balancers) are communicating with each other.
* **Security Auditing:** Distinguish between allowed traffic (`ACCEPT`) and traffic blocked by Security Groups or NACLs (`REJECT`).
* **Pattern Detection:** Identify port scanning, failed connection attempts, or unusual outbound traffic.

## Limitations
* **No Payload Inspection:** Only captures metadata (IP, port, protocol, bytes), not the actual packet content.
* **Reporting Latency:** Logs are not instantaneous; there is a delay of several minutes between the traffic event and its appearance in CloudWatch.
* **Cost:** Storage and analysis in CloudWatch incur costs that should be monitored.
