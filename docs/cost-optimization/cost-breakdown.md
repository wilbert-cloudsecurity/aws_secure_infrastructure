# Infrastructure Cost Breakdown

This document provides an overview of our primary infrastructure cost drivers and the architectural strategies we employ to keep operational expenses (OPEX) optimized.

## 1. EC2 Costs
EC2 instances represent our largest compute expense. 
* **Instance Sizing:** We utilize `t3.micro` instances for our development environments, balancing sufficient performance with the lowest possible hourly rate.
* **Lifecycle Management:** We ensure that non-production instances are properly tagged and, where applicable, scheduled to shut down during off-hours to prevent "ghost" billing.

## 2. CloudWatch Costs
CloudWatch is essential for observability, but its costs are usage-based.
* **Data Ingestion:** We incur costs based on the volume of logs ingested. To optimize this, we have set a 7-day retention policy on our log groups, preventing the accumulation of stale data.
* **Metric Alarms:** We limit our alarm set to high-impact indicators (CPU, Status Checks) to avoid unnecessary costs associated with monitoring excessive, non-critical metrics.

## 3. Flow Logs Costs
VPC Flow Logs provide critical network visibility but are billed by the gigabyte of processed data.
* **Optimization:** We aggregate traffic at the VPC level and focus on capturing "ALL" traffic types only during debugging. For steady-state operation, we can tune this to capture only `REJECT` traffic to minimize volume while still maintaining visibility into security threats.

## 4. Why We Avoided NAT Gateway
To maintain a lean and secure budget, we prioritized **VPC Endpoints** over **NAT Gateways**.
* **The NAT Gateway Problem:** A NAT Gateway carries a fixed hourly charge plus a data processing fee for every gigabyte that passes through it. In a high-traffic environment, these costs can spiral quickly.
* **The VPC Endpoint Advantage:** By using Gateway Endpoints (for S3) and Interface Endpoints (for CloudWatch and other services), our traffic stays within the private AWS network. 
* **Cost Efficiency:** VPC Endpoints eliminate the "data processing" tax associated with NAT Gateways for AWS-native services. Additionally, this architecture is inherently more secure, as it reduces the attack surface by keeping traffic off the public internet.

## Summary of Cost Optimization Philosophy
* **Least Privilege Networking:** Only expose what is necessary.
* **Retention Awareness:** Do not store data longer than required for compliance or troubleshooting.
* **AWS-Native Connectivity:** Prefer private AWS network paths over public internet routing.
