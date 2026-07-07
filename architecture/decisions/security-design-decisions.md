# Architectural Security Design Decisions

This document outlines the key architectural decisions implemented within our cloud infrastructure to mitigate risks, align with industry best practices (such as the AWS Well-Architected Framework), and maintain a secure operating environment.

---

### 1. Why SSH Access is Strictly Restricted by IP
**Decision:** The Security Group associated with SSH access (Port 22) does not allow open traffic from any source (`0.0.0.0/0`). Instead, it is strictly restricted to specific static IP addresses or trusted corporate VPN CIDR ranges.
- **Justification:** The SSH protocol is a constant target for automated brute-force attacks and zero-day exploits. By restricting network-level access to trusted source IPs, unauthorized connection attempts are dropped immediately at the perimeter layer, long before they can even attempt authentication.

### 2. Why Private Instances Have No Public IP
**Decision:** Instances deployed within the application logic and database subnet layers have public IPv4 auto-assignment explicitly disabled.
- **Justification:** Without a publicly routable IP address on the internet, these instances are effectively invisible within the global network space. This eliminates the possibility of direct targeted internet attacks and guarantees that all communication must occur internally via private VPC routing.

### 3. Why the Bastion Host Pattern Was Used
**Decision:** A dedicated, hardened Bastion Host instance was deployed in the public subnet to serve as the single, mandatory point of inbound SSH entry for network administration.
- **Justification:** This pattern bridges the operational requirement of server management with the security requirement of network isolation. It acts as a tactical buffer zone, allowing the security team to enforce strict authentication, Multi-Factor Authentication (MFA), and detailed logging in a single location to safeguard the core internal network.

### 4. Why Dev and Prod Subnets Exist Separately
**Decision:** Development (Dev) and Production (Prod) environments are strictly isolated using separate subnets, independent CIDR blocks, and segregated access control policies (or entirely separate AWS accounts).
- **Justification:** This segregation adheres to the principle of **Environment Isolation** and prevents human error and cross-environment impact. Testing, experimental deployments, and development configurations must never jeopardize the stability, availability, or integrity of production systems. Furthermore, it enables differentiated compliance policies, restricting access to sensitive production data.
