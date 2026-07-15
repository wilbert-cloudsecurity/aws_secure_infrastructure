# Identity and Access Management (IAM) Strategy

This document outlines our standards for managing identities, roles, and permissions within the AWS environment to ensure a secure, least-privilege-based infrastructure.

## Minimal IAM Permissions
We enforce the Principle of Least Privilege (PoLP) across all IAM entities:
* **Task-Specific Policies:** Policies are scoped down to the specific actions and resources required for a service to function (e.g., granting `s3:GetObject` only on the specific bucket needed, rather than `s3:*`).
* **No Long-Lived Credentials:** We avoid using IAM Users and Access Keys. Instead, we use **IAM Roles** with temporary security credentials provided by AWS for EC2 instances and CI/CD pipelines.
* **Inline vs. Managed:** We prefer AWS Managed Policies for standard tasks, supplemented by narrowly scoped inline policies for specific custom requirements.

## Monitoring Roles
Monitoring components operate under a distinct security profile:
* **CloudWatch Agent Role:** This role is explicitly restricted to `logs:PutLogEvents`, `logs:CreateLogStream`, and `logs:DescribeLogStreams`. It has no permissions to modify infrastructure, manage EC2, or access other services.
* **Auditability:** Every action performed by a monitoring role is logged via **CloudTrail**, allowing us to audit exactly what data is being transmitted to our monitoring backend.
* **Isolation:** The credentials used for monitoring are never shared with application code or administrative shells.

## Future Hardening Goals
To continuously evolve our security posture, we have identified the following goals:
* **IAM Access Analyzer:** We plan to implement the IAM Access Analyzer to proactively identify and remove unused permissions or overly broad policies.
* **Attribute-Based Access Control (ABAC):** Moving beyond role-based access, we aim to implement ABAC to grant permissions based on tags (e.g., "Allow access if the resource tag `Project` matches the user tag `Project`").
* **Multi-Factor Authentication (MFA) Enforcement:** Extending MFA requirements to all human-accessible roles and programmatic access points where feasible.
* **Automated Policy Cleanup:** Implementing CI/CD checks to automatically detect and flag "Allow *" permissions during the Pull Request review process.
