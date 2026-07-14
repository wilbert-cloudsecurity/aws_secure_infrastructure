# Operational Workflow: From Deployment to Resolution

This document defines the operational lifecycle of our infrastructure, ensuring that every stage—from code change to troubleshooting—is standardized.

## 1. Infrastructure Deployment & CI/CD
Our deployment process follows a robust CI/CD pipeline to ensure quality and security:

* **Code Change:** Infrastructure modifications are initiated via feature branches in our version control system.
* **Git Commit:** Changes are committed and pushed, triggering the automation pipeline.
* **GitHub Actions Validation:** Automated workflows execute `terraform fmt` and `tflint` to ensure code quality and style compliance.
* **Terraform Validation:** The pipeline performs `terraform validate` to check for syntax and configuration integrity, followed by a `terraform plan` to preview changes.
* **Deployment Readiness:** Once the plan is verified and peer-reviewed, the pipeline marks the deployment as ready to be applied to the target environment.
* **State Management:** The final state is stored in a remote S3 backend with DynamoDB locking for consistency.

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
* **Closure:** Once resolved, we document the Root Cause (RCA) and apply necessary code changes to prevent recurrence.
