# Investigation Examples

This document outlines how to use VPC Flow Logs to investigate network anomalies and validate infrastructure isolation.

## Investigating Network Traffic
To analyze suspicious behavior:
1. **Define the Timeframe:** Identify the exact window where the anomaly occurred.
2. **Filter by Action:** Use the `REJECT` action to focus on traffic blocked by your security groups or network ACLs.
3. **Analyze Source Behavior:** Use `stats count() by srcAddr` to identify if a single IP address is repeatedly targeting your services, which is a common indicator of port scanning.

## Validating Network Isolation
To ensure your private subnets are properly isolated:
* Search for `ACCEPT` traffic where the source IP (`srcAddr`) is outside your VPC but the destination (`dstAddr`) is inside your private subnet.
* If you find `ACCEPT` entries from unauthorized external IPs, your Security Group rules are too permissive.

## Detecting Failed Attempts
* **Monitor Rejections:** A sudden spike in `REJECT` logs (e.g., in a 5-minute interval) is a classic indicator of automated port scanning.
* **Proactive Security:** Use this data to proactively tighten Security Group rules and block malicious subnets.
