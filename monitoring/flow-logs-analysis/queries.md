# Flow Logs Analysis Queries

These queries are designed for **CloudWatch Logs Insights** to identify network patterns and security anomalies.

## 1. Find rejected SSH traffic
This query identifies potential unauthorized access attempts to your instances.
```sql
filter action = "REJECT" and dstPort = 22
| stats count(*) by srcAddr
| sort count(*) desc

filter action = "ACCEPT" and srcAddr like "10.0."
| stats sum(bytes) as totalBytes by dstAddr
| sort totalBytes desc
| limit 10

filter dstAddr = "10.0.x.x" and srcAddr != "10.0.y.y"
| fields @timestamp, srcAddr, dstAddr, action
| sort @timestamp desc
