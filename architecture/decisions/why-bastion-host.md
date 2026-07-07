# Why Bastion Host?

The **Bastion Host** (or Jump Box) design pattern serves as the sole secure, audited entry bridge for the remote administration of infrastructure hosted inside private subnets. It is an essential component in robust cloud architectures that mitigates the risks associated with server management.

The primary objectives of this pattern are:

### 1. Centralizing Administrative Access
Instead of allowing multiple individual instances to have independent access configurations, the Bastion Host centralizes all remote administrative connection attempts (such as SSH or RDP).
- **Benefit:** This drastically simplifies firewall rule management (Security Groups). System administrators and SOC analysts only need to maintain and monitor access rules for a single critical network node, reducing operational complexity and configuration errors.

### 2. Preventing Direct Exposure
Under no circumstances should production instances or backend databases containing sensitive information expose their management ports (e.g., Port 22 for SSH) directly to the public internet.
- **Benefit:** The Bastion Host sits in the public subnet and is the only element configured to receive external management traffic. Private instances are then configured to accept SSH connections *exclusively* from the internal private IP address of the Bastion Host, shielding them from direct external threats.

### 3. Future Auditability and Traceability
By centralizing all administrative traffic through a single node, the Bastion Host becomes a high-fidelity audit enforcement point for the security team.
- **Benefit:** It allows for the implementation of exhaustive session logging (SIEM/Logs) tracking who accessed the network, when they accessed it, and what commands were executed. In the event of a security incident, Bastion Host logs (forwarded securely to centralized audit buckets like Amazon S3 or CloudWatch Logs) provide an unalterable timeline for forensic analysis.
