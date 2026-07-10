# CloudWatch Dashboards Configuration

## 1. Basic Metrics Overview
CloudWatch Dashboards allow us to visualize the performance of our EC2 instances. By aggregating key metrics, we can observe trends, detect anomalies, and ensure our infrastructure is operating within expected parameters.

## 2. CPU Utilization
* **Definition:** Measures the percentage of allocated EC2 compute units that are currently in use.
* **Why it matters:** High CPU utilization (consistently >80%) can lead to application latency, processing bottlenecks, or service failure. Low utilization may indicate over-provisioning and potential cost savings.
* **Visualization:** Line chart showing the `CPUUtilization` metric over time, with threshold markers for warning (e.g., 75%) and critical (e.g., 90%) states.

## 3. Network Traffic
* **Definition:** Monitors the volume of data sent (`NetworkOut`) and received (`NetworkIn`) by the instance.
* **Why it matters:** Monitoring network throughput is essential for identifying potential DDoS attacks, data exfiltration, or unexpected spikes in traffic that could impact performance or incur unplanned data transfer costs.
* **Visualization:** Stacked area chart or dual-line chart plotting `NetworkIn` and `NetworkOut` (measured in Bytes/s or Packets/s) to show the flow of information.

## 4. Instance Health
* **Definition:** Tracks the operational state of the instance, primarily through the `StatusCheckFailed` metric.
* **Why it matters:** A status check failure indicates that the instance is unreachable or the underlying hardware has failed. Proactive monitoring here is critical for triggering automated recovery actions.
* **Visualization:** A single-stat widget or a color-coded status bar (Green: OK, Red: Failed) based on the combined `StatusCheckFailed` metric (System + Instance).
