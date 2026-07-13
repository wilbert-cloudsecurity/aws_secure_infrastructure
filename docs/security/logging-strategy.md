# Logging & Observability Security Strategy

## Principle of Least Privilege (PoLP) for Monitoring
Monitoring and logging systems must follow the "least privilege" principle to ensure that if a monitoring account is compromised, the impact on the rest of the infrastructure is minimized.
* **Granular Access:** Monitoring agents (like the CloudWatch Agent) should only have permissions to `PutLogEvents` and `DescribeLogStreams`, never administrative rights over the VPC or EC2 instances.
* **Separation of Duties:** The identity used for generating logs must be distinct from the identity used for managing the log storage or analyzing the logs.

## CloudWatch Access
Access to CloudWatch Logs is strictly controlled via IAM policies:
* **Writing Logs:** Instances are assigned an IAM Role with `CloudWatchAgentServerPolicy`, which grants limited write access to CloudWatch Logs.
* **Reading/Analyzing Logs:** Developers and operators use IAM roles with `CloudWatchReadOnlyAccess` or custom policies that restrict access to specific Log Groups, preventing unauthorized access to sensitive application data.
* **Cross-Account Access:** For multi-environment setups, we utilize specific IAM roles to allow centralized logging accounts to ingest data without granting cross-account infrastructure control.

## Why Observability Permissions Matter
Observability is often overlooked as a potential security attack vector. The reasons for securing these permissions are:
* **Prevention of Log Tampering:** If an attacker gains broad permissions, they could delete logs to hide their tracks (anti-forensics).
* **Data Leakage:** Logs often inadvertently contain sensitive information (PII, session tokens, API keys). Restricting who can view these logs is a critical data protection measure.
* **Denial of Service (DoS) Prevention:** Unauthorized modification of logging configuration could be used to overwhelm CloudWatch or trigger excessive costs through malicious log flooding.
