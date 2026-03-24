# Cloud Resume Challenge - AWS

This repository contains the source code and Infrastructure as Code (IaC) for a serverless portfolio website deployed on Amazon Web Services (AWS), implemented as part of the [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/).

## Architecture & Technology Stack

The project utilizes a modern, serverless architecture on AWS, ensuring high availability, scalability, and minimal operational overhead.

- **Frontend**: Custom HTML5, CSS3, and Vanilla JavaScript hosted statically on Amazon S3.
- **Backend API**: Amazon API Gateway (HTTP API) handles routing and CORS for an AWS Lambda function running Python 3.12 (utilizing `boto3`).
- **Database**: Amazon DynamoDB serves as the NoSQL database for atomic page view tracking.
- **Infrastructure as Code (IaC)**: HashiCorp Terraform is used for comprehensive state management and automated resource provisioning.
- **Continuous Integration/Continuous Deployment (CI/CD)**: GitHub Actions automates the deployment pipeline. Authentication is secured via AWS OpenID Connect (OIDC), eliminating the need for long-lived static credentials.

## Live Deployment

The active, deployed resume can be accessed at the following endpoint:  
[http://chk-resume-website-eu-north-1.s3-website.eu-north-1.amazonaws.com](http://chk-resume-website-eu-north-1.s3-website.eu-north-1.amazonaws.com)

## Blog Post

Read about the full journey of building this architecture, the roadblocks encountered, and the solutions implemented in my detailed write-up:  
[From Hello World to Infrastructure as Code: My Journey Through the Cloud Resume Challenge](https://spring-goldenrod-4b3.notion.site/From-Hello-World-to-Infrastructure-as-Code-My-Journey-Through-the-Cloud-Resume-Challenge-32d45cba4def80918d91f42d26e0f441)

## Repository Structure

```text
├── .github/workflows/deploy.yml   # CI/CD pipeline definitions
├── backend/
│   └── lambda_function.py         # Serverless function for visitor analytics
├── frontend/
│   ├── index.html                 # UI layout and content structure
│   ├── style.css                  # Custom styling and responsive design
│   └── script.js                  # Asynchronous data fetching logic
└── terraform/                     # IaC configurations
    ├── main.tf                    # Core AWS resource definitions
    ├── variables.tf               # Environment variables and configurations
    ├── providers.tf               # AWS provider and region settings
    └── oidc.tf                    # GitHub Actions IAM OIDC trust relationships
```

## Deployment Pipeline

Deployment is fully automated through a CI/CD pipeline established with GitHub Actions. 

Upon any code push to the `main` branch, the workflow:
1. Assumes an IAM role securely using an AWS OIDC identity provider.
2. Executes `terraform init` and `terraform apply -auto-approve` to synchronize infrastructure state.
3. Synchronizes the local `frontend/` directory with the designated Amazon S3 bucket.

## License

This software is released under the MIT License. See the [LICENSE](LICENSE) file for further details.