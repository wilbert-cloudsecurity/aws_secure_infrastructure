# Why Separate Development and Production

## Problem

Using a single environment for development and production increases operational risk.

## Risks

- Accidental changes affecting production
- Testing on production systems
- Reduced visibility of environment boundaries

## Decision

Create dedicated development and production private subnets with independent instances.

## Benefits

- Better isolation
- Easier troubleshooting
- Reduced blast radius
- Clear operational boundaries

## Tradeoffs

- Additional infrastructure
- Slightly higher cost
- More resources to manage
