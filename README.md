# AWS DevSecOps Infrastructure

[![Terraform](https://img.shields.io/badge/Terraform-1.x-purple.svg)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange.svg)](https://aws.amazon.com/)
[![Security](https://img.shields.io/badge/Security-DevSecOps-green.svg)]()

## 🏗️ Architecture Overview
This project implements a secure, scalable, and observable AWS architecture. It leverages a **VPC** with public/private subnet segmentation. The public subnet hosts a **Bastion Host** for secure ingress, while private subnets host core application instances, ensuring they are isolated from the public internet.


## 🎯 Project Goals
* **Security First:** Implement strict network isolation and the Principle of Least Privilege (PoLP).
* **Observability:** Achieve full visibility through VPC Flow Logs and CloudWatch monitoring.
* **Automation:** Standardize infrastructure deployments using Terraform and CI/CD pipelines.
* **Cost Efficiency:** Optimize resource usage by prioritizing VPC Endpoints over expensive NAT Gateways.

## 🚀 Key Features
* **Network Segmentation:** Multi-tier subnets for resource isolation.
* **Secure Access:** Bastion-only access via SSH tunneling.
* **Automated Observability:** Integrated CloudWatch Agent and VPC Flow Logs.
* **Cost-Optimized:** Use of private network paths for AWS services.

## 🛡️ Security Controls
* **Hardened Access:** Restricted SSH via Bastion host; no direct public internet access for application servers.
* **IaC Scanning:** Automated security analysis using `tfsec` and `checkov`.
* **IAM Strategy:** Minimal permissions for monitoring roles and EC2 instances.
* **Configuration Drift:** Regular validation to ensure the environment matches the desired state.

## 👁️ Observability
* **Logging:** Centralized logs through CloudWatch Agent.
* **Network Analysis:** VPC Flow Logs to monitor traffic and identify rejected connections.
* **Proactive Alerting:** Metric-based alarms for critical health indicators.

## ⚙️ CI/CD Pipeline
Fully automated workflow using **GitHub Actions**:
1. **Linting & Formatting:** Ensures consistent code style.
2. **Security Scanning:** Automated `tfsec` and `checkov` checks.
3. **Terraform Validation:** Ensures syntax and configuration integrity.
4. **Deployment:** Terraform plan and apply workflow.

## 📅 Development Journey (Project Progress)
| Day | Milestone |
| :--- | :--- |
| 1 | Repository foundation & VPC core |
| 2-4 | Network segmentation & Bastion deployment |
| 5-7 | Observability & CloudWatch integration |
| 8-10 | CI/CD pipeline & Security hardening |

## 🚀 Future Improvements
* Implementation of **Auto Scaling Groups** for high availability.
* Transition to **Attribute-Based Access Control (ABAC)** for IAM.
* Integration of **AWS WAF** for application-level security.
* Enhanced alerting using **Amazon SNS** for immediate incident notification.
