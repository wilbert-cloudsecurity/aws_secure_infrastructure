# Why VPC Endpoints

## Problem

Private instances often require access to AWS services.

Without VPC Endpoints, this traffic may depend on Internet connectivity.

## Decision

Use Interface VPC Endpoints for AWS services required by private workloads.

## Benefits

- Reduced Internet dependency
- Smaller attack surface
- Private AWS service communication

## Tradeoffs

- Additional resources
- Additional endpoint cost
