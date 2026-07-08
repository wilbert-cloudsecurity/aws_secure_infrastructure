# Lessons Learned: AWS Infrastructure & Security

This document captures technical insights, critical design decisions, and security principles discovered during the development of this AWS infrastructure project.

## 🌐 Networking & VPC Architecture

*   **Subnet Names vs. Reality**: A subnet is **not** private simply because it is labeled "private".
*   **Defining Accessibility**: True network isolation is determined by the specific **Routing Configuration** and the **absence of public IP addresses**.
*   **The "Public" Checklist**: For a subnet to be genuinely public, it requires three conditions:
    *   An active Internet Gateway (IGW) attached to the VPC.
    *   A route to `0.0.0.0/0` in the associated route table pointing to that IGW.
    *   Proper route table-to-subnet association.

## 🛡️ Security & Access Control

*   **Bastion Host Strategy**: Centralizing administrative access via a Bastion Host effectively minimizes the attack surface.
*   **Hardened Gateways**: The Bastion acts as a controlled entry point, ensuring private instances remain unreachable from the public internet.
*   **Security Groups (Least Privilege)**: Security is reinforced by implementing **SG-to-SG communication** rather than opening ports to broad IP ranges.
*   **Validating Isolation**: "Expected failure" is a valid security test. Attempting direct SSH connections to private resources and confirming they timeout validates that the networking layer is correctly isolated.

## 🛠️ Infrastructure as Code (IaC) & Troubleshooting

*   **Modular Scalability**: Utilizing a modular Terraform structure is essential for long-term maintainability.
*   **Consistent Baselines**: Modularity allows for clean environment separation (Dev/Prod) while maintaining identical security baselines.
*   **Troubleshooting Pattern**: When encountering AWS API errors (e.g., `InvalidKeyPair.NotFound`), the solution is to verify resource existence in the specific region/account before the `terraform apply` phase.
