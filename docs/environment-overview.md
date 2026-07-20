# Environment Overview

This document defines the purpose and architectural role of each environment in our AWS infrastructure.

## Environment Definitions

### Dev
* **Purpose:** Development and testing.
* **Role:** Provides a sandbox for experimenting with infrastructure changes, testing application deployments, and validating CI/CD pipeline triggers. Resources here are transient and optimized for cost.

### Prod
* **Purpose:** Production workload simulation.
* **Role:** Mirrors the production environment configuration as closely as possible. It is used for final validation before any changes are promoted to the live application, ensuring stability, security compliance, and performance consistency.

### Bastion
* **Purpose:** Controlled administrative access.
* **Role:** Acts as the secure "jump box" for the entire VPC. It resides in the public subnet and is the only authorized entry point for administrative tasks. All access to the Dev and Prod instances—regardless of their environment—must originate from this host via SSH tunneling to maintain a strict security perimeter.

## Network & Access Strategy
* **Isolation:** Both Dev and Prod instances are deployed in private subnets, ensuring they have no direct exposure to the public internet.
* **Controlled Access:** The Bastion host is the only resource with an Internet Gateway route, forcing all administrative traffic through a single, audited, and hardened point of entry.
* **Consistency:** While Dev and Prod serve different purposes, they follow identical security hardening patterns to ensure that code tested in Dev behaves predictably when simulated in the Prod environment.
