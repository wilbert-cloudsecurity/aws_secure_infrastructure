# Metrics and Alarms Strategy

## Monitored Metrics
We currently focus on core infrastructure health using AWS CloudWatch metrics:
* **CPU Utilization:** Measures the percentage of allocated compute capacity in use.
* **Network Traffic:** Tracks `NetworkIn` and `NetworkOut` to identify data transfer patterns.
* **Instance Health:** Monitors `StatusCheckFailed` to ensure the underlying hardware and OS are reachable.

## Why CPU Utilization Matters
CPU utilization is the primary indicator of compute-bound workloads. High, sustained CPU usage often correlates with application latency, request timeouts, and potential service degradation. Conversely, consistently low CPU utilization may indicate over-provisioning and inefficient resource allocation.

## Basic Thresholds
Our current baseline thresholds are:
* **Warning:** > 75% CPU utilization sustained for 15 minutes.
* **Critical:** > 90% CPU utilization sustained for 5 minutes.
* **Health:** Any `StatusCheckFailed` value > 0 triggers an immediate critical alert.

## Current Limitations
* **Granularity:** We are currently using standard 1-minute resolution; detailed monitoring could provide better insights for high-frequency spikes.
* **Context:** We lack application-level metrics (e.g., HTTP 5xx error rates) to correlate infrastructure spikes with user impact.
* **Predictive Analysis:** We are not yet utilizing anomaly detection to identify deviations from normal patterns automatically.
