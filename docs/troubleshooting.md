# Troubleshooting & Incident Response

This document contains the standard operating procedures to diagnose and resolve the most common issues in our infrastructure.

## 1. SSH Failures
If you cannot connect via SSH, follow this diagnostic order:
* **Connectivity:** Verify you are attempting to connect to the correct public IP. If the instance is in a private subnet, confirm you are using the **Bastion Host** as a tunnel (`ssh -J bastion ...`).
* **Security Groups:** Check that the private instance's Security Group allows traffic on port 22 *only* from the Bastion Host's Security Group, not from your personal IP.
* **Network ACLs:** Ensure that the subnet’s NACL rules are not blocking ephemeral return traffic.

## 2. Log Investigation
If an application fails and the cause is unknown:
* **CloudWatch Agent:** Confirm the process is running on the instance (`systemctl status amazon-cloudwatch-agent`).
* **Permissions:** Verify that the instance's IAM Role has the `CloudWatchAgentServerPolicy` attached.
* **Querying:** Use *CloudWatch Logs Insights* to search for specific errors in the relevant Log Group:
  `filter @message like /ERROR/ | sort @timestamp desc`

## 3. Flow Logs (Network Analysis)
Use these when you suspect silent network blocks:
* **Identify Rejections:** If a connection fails and the Security Group seems correct, filter by `action = "REJECT"` in the Flow Logs.
* **Flow Direction:** Verify if the traffic is reaching the instance's ENI or if it is being intercepted earlier (e.g., at the NACL level).

## 4. Alarm Validation
If you receive a CloudWatch alert:
* **Check Data Points:** Did the metric actually cross the threshold, or was it a transient spike? View the graph in the Dashboard.
* **Validate Context:** Are there other alarms active simultaneously? (e.g., A CPU spike combined with a `NetworkIn` increase could indicate an attack or a legitimate bulk update).
* **Acknowledge vs. Fix:** If it is a transient issue, document the event. If it is recurring, tune the alarm threshold or scale the resource.
