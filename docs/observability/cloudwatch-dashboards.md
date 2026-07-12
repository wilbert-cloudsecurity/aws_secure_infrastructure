# CloudWatch Dashboards Configuration

## 1. Basic Metrics Overview
CloudWatch Dashboards allow us to visualize the performance of our EC2 instances. By aggregating key metrics, we can observe trends, detect anomalies, and ensure our infrastructure is operating within expected parameters.

## 2. Current Dashboard Implementation
Our dashboard is currently configured as a centralized view for both `dev` and `prod` environments, providing a "single pane of glass" to monitor instance performance and network health.

### Metrics Visualized
* **CPU Utilization:** Line chart tracking compute performance to prevent service degradation.
* **Network Traffic:** Dual-line chart plotting `NetworkIn` and `NetworkOut` to identify anomalous throughput.
* **Instance Health:** Status widgets monitoring `StatusCheckFailed` (System and Instance) to ensure rapid incident response.

## 3. CPU Utilization
* **Definition:** Measures the percentage of allocated EC2 compute units currently in use.
* **Why it matters:** Sustained utilization >80% leads to latency and bottlenecks; low utilization indicates potential over-provisioning.
* **Visualization:** Line chart with threshold markers for Warning (75%) and Critical (90%).

## 4. Network Traffic
* **Definition:** Monitors data volume (`NetworkIn`/`NetworkOut`) in Bytes/s.
* **Why it matters:** Essential for detecting DDoS patterns, unexpected data exfiltration, or traffic spikes.
* **Visualization:** Stacked area chart to visualize bandwidth consumption over time.

## 5. Instance Health
* **Definition:** Tracks operational state via the `StatusCheckFailed` metric.
* **Why it matters:** Proactive identification of hardware or unreachable instance issues.
* **Visualization:** Color-coded single-stat widget (Green: OK, Red: Failed).

## 6. Future Roadmap
To evolve our observability posture, we plan to:
* **Application-Level Metrics:** Integrate custom metrics for HTTP error rates and latency.
* **Automated Dashboarding:** Use Terraform to programmatically deploy and update dashboards across new environments.
* **Unified Alerts:** Correlate dashboard visualization with triggered CloudWatch Alarms for faster root-cause analysis (RCA).
