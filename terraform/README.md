# Infrastructure - Cloud Resume Challenge

This directory houses the Terraform states and definitions used to provision every single AWS resource in this project.

## Cloud Strategy
Using Infrastructure as Code (IaC), this folder constructs an entirely automated Cloud Architecture bridging compute, database, object storage, API delivery, and granular security policies out of thin air via single file configurations.

## Files
- `main.tf`: Provisions the Static S3 bucket, DynamoDB table, Lambda zip packaging & function loading, API Gateway with HTTP proxy paths, and bucket public access policies.
- `providers.tf`: Forces AWS version configurations and manages identical region bounds (`eu-north-1`).
- `backend.tf`: Configures remote state. Shifts the `.tfstate` to an encrypted external S3 bucket, allowing local laptops and cloud runners (GitHub Actions) to collaborate safely without losing state context.
- `variables.tf`: Maintains configurable environment standards.
- `oidc.tf`: Provisions the OIDC provider logic mapping explicit, isolated GitHub Repository Trust capabilities directly to IAM Roles without exporting permanent tokens.

## Usage
Inside this `/terraform` directory, run:
1. `terraform plan` to view expected changes statefully against your AWS Account.
2. `terraform apply` to build.