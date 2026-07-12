# Alerting Strategy

## What Should Trigger Alerts
We prioritize actionable alerts that indicate a breach in service availability or performance:
* **Service Downtime:** Any instance or endpoint becoming unreachable.
* **Critical Resource Exhaustion:** CPU or memory levels that prevent the application from processing incoming requests.
* **Security Anomalies:** Unusual patterns in VPC Flow Logs (e.g., repeated `REJECT` attempts on SSH ports).

## What Should NOT Generate Alerts
To maintain system focus, we avoid alerts for:
* **Informational Logs:** Regular application startup/shutdown logs or routine housekeeping tasks.
* **Transient Spikes:** Short-lived CPU spikes (< 1 minute) that do not impact end-user performance.
* **Development Noise:** Logs generated in non-production environments that do not require immediate intervention.

## Avoiding Alert Fatigue
* **Alert Grouping:** Use CloudWatch Alarms to aggregate multiple events, ensuring we are alerted on the "symptom" (service down) rather than every single underlying "cause."
* **Threshold Tuning:** We regularly review alert thresholds to ensure they are high enough to avoid false positives but low enough to capture real issues.

## Useful Monitoring vs. Noise
* **Useful Monitoring:** Provides clear context and a defined remediation path (e.g., "CPU high -> Review scaling policy").
* **Noise:** Provides data without context or clear action items (e.g., "Generic system warning without incident impact"). Our goal is to move towards observability that drives direct operational action.
