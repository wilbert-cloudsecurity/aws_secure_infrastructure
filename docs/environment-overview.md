# Environment Overview

## Purpose

This project simulates a small AWS environment with separated development and production workloads.

## Architecture

- Public subnet for administrative access
- Private development environment
- Private production environment

## Components

### Bastion Host

Provides controlled administrative access to private instances.

### Development Environment

Used for testing infrastructure changes.

### Production Environment

Represents production workloads and remains isolated from direct internet access.

## Security Goals

- Network segmentation
- Controlled access
- Reduced attack surface
- Environment isolation
