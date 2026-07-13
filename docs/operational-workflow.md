# Operational Workflow: From Deployment to Resolution

This document defines the operational lifecycle of our infrastructure, ensuring that every stage—from deployment to troubleshooting—is standardized.

## 1. Infrastructure Deployment
All infrastructure changes are performed using **Terraform**.
* **Process:** Code must be peer-reviewed, validated via `terraform plan`, and applied only after confirming there are no circular dependencies or insecure configurations.
* **State:** We maintain the state in a remote backend (S3 + DynamoDB) to ensure consistency.

## 2. Monitoring
Visibility begins immediately after deployment.
* **Configuration:** Automated deployment of CloudWatch Dashboards and log agents via Terraform modules.
* **Scope:** Active monitoring of health metrics (CPU, Network) and EC2 instance availability.

## 3. Alerting
The alerting system acts as our first line of defense.
* **Criteria:** Alerts are triggered based on defined thresholds to prevent outages (e.g., > 90% CPU) or detect anomalies (e.g., unexpected rejected traffic).
* **Management:** Alerts are routed to critical channels to ensure rapid response, filtering out purely informational noise.

## 4. Investigation
Upon receiving an alert, we initiate the data collection phase.
* **Tools:** Use *CloudWatch Logs Insights* to analyze historical behavior.
* **Focus:** Determine if the event is a transient spike, a Security Group misconfiguration, or genuine service degradation.

## 5. Troubleshooting
The final phase to restore normal operations.
* **Action:** Execution of the procedures defined in `docs/troubleshooting.md`.
* **Closure:** Once resolved, we document the Root Cause (RCA) and apply necessary code (Terraform) changes to prevent recurrence.
