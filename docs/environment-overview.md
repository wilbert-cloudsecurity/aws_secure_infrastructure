# Environment Overview

This document provides a high-level architectural summary of our AWS infrastructure, designed for scalability, security, and observability.

## 1. VPC & Subnet Design
The infrastructure is contained within a dedicated Virtual Private Cloud (VPC), segmented into:
* **Public Subnets:** Host the Bastion Host and NAT components (if required), serving as the single point of entry.
* **Private Subnets:** Host application instances and databases. These subnets have no route to the Internet Gateway, ensuring complete isolation from public inbound traffic.

## 2. Access Management (Bastion & Private EC2)
* **Bastion Host:** A hardened, minimal-footprint EC2 instance in the public subnet that acts as a secure jump box.
* **Private EC2:** Application servers reside in private subnets. They are reachable only via SSH tunneling through the Bastion Host, preventing direct exposure to the public internet.

## 3. Monitoring & Observability
We prioritize visibility through an integrated monitoring stack:
* **CloudWatch Agent:** Installed on all EC2 instances to stream system logs and metrics to CloudWatch.
* **VPC Flow Logs:** Enabled to capture network traffic metadata, allowing us to audit connections and troubleshoot connectivity issues (specifically `REJECT` actions).
* **Dashboards:** Centralized CloudWatch Dashboards provide real-time health metrics.

## 4. CI/CD Pipeline
Our deployment lifecycle is fully automated:
* **Version Control:** All infrastructure is managed as code (IaC) via Terraform.
* **Automation:** GitHub Actions serves as our CI/CD engine, handling linting, security scanning (`tfsec`/`checkov`), and the deployment process (`plan` and `apply`).
* **Validation:** Every change undergoes automated validation and peer review before being applied to the production state, ensuring that our infrastructure matches our documented architecture.
