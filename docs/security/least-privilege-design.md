# Least Privilege Design & Infrastructure Security

This document outlines the architectural patterns we employ to enforce the principle of least privilege at the network and identity layers.

## Restricted SSH
We eliminate direct SSH access to the public internet.
* **Bastion Host:** Access to private instances is only possible through a hardened Bastion Host. 
* **Tunneling:** Users must utilize SSH tunneling (`ssh -J`) to reach private resources, ensuring that the private instances never have public IP addresses or ingress rules open to the internet.

## SG Isolation (Security Group Isolation)
Security Groups function as our internal firewalls, strictly enforcing the principle of least privilege:
* **Micro-segmentation:** Security Groups are created per function (e.g., `bastion-sg`, `private-app-sg`).
* **Source-Based Rules:** Access to private instances is restricted *only* to the Security Group ID of the Bastion Host. We never use `0.0.0.0/0` for ingress on private resources.

## Private Infrastructure
We design our network topology to prevent lateral movement and unauthorized exposure:
* **Subnet Segmentation:** Critical application and database workloads are strictly deployed in private subnets with no route to an Internet Gateway.
* **Internal Communication:** All inter-service communication is restricted to the necessary ports and protocols, defined clearly within our Terraform modules.

## Minimizing Exposure
We treat every open port as a potential vulnerability:
* **Reduced Attack Surface:** Only essential ports are opened. By default, all inbound traffic is denied (Deny-All).
* **Automated Auditing:** We regularly scan Security Group configurations using IaC security tools to detect and automatically revert overly permissive rules.
* **IAM Integration:** Access to infrastructure management is tied to IAM roles rather than permanent credentials, ensuring that access is temporary and audited.
