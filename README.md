# Cloud Resume Challenge - AWS

Welcome to the source code for my [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/), deployed entirely on AWS!

This repository contains the full-stack code and Infrastructure as Code (IaC) required to deploy a scalable, serverless, and robust portfolio website.

## 🏗️ Architecture & Tech Stack

This project leverages a modern serverless architecture on AWS:

- **Frontend**: Custom HTML5, CSS3, and Vanilla JavaScript. Hosted statically on **Amazon S3**.
- **Backend API**: **Amazon API Gateway** (HTTP API) handling routing and CORS, hooked into an **AWS Lambda** function written in **Python 3.12** using `boto3`.
- **Database**: **Amazon DynamoDB** NoSQL database tracking atomic page view increments.
- **Infrastructure as Code (IaC)**: **Terraform** manages the state and automated provisioning of every cloud resource.
- **CI/CD**: Fully automated pipeline using **GitHub Actions**. Securely authenticates with AWS via **OpenID Connect (OIDC)** without the need for long-lived access keys.

## 🌐 Live Demo

You can view the live, deployed resume here:  
[http://chk-resume-website-eu-north-1.s3-website.eu-north-1.amazonaws.com](http://chk-resume-website-eu-north-1.s3-website.eu-north-1.amazonaws.com)

## 📁 Repository Structure

```text
├── .github/workflows/deploy.yml   # CI/CD Pipeline configuration
├── backend/
│   └── lambda_function.py         # Python code for the visitor counter
├── frontend/
│   ├── index.html                 # UI layout and text
│   ├── style.css                  # Dark-mode dashboard styling
│   └── script.js                  # Frontend API fetching logic
└── terraform/                     # Terraform IaC configurations
    ├── main.tf                    # S3, Lambda, API Gateway, DynamoDB definitions
    ├── variables.tf               # Environment variables
    ├── providers.tf               # AWS Provider setup
    └── oidc.tf                    # GitHub Actions IAM OIDC integration
```

## 🚀 Deployment

The deployment process is entirely automated. Because of the OpenID Connect (OIDC) integration, you do not need to store long-lived AWS credentials in GitHub Secrets.

Any pushes to the `main` branch trigger the GitHub Actions workflow, which:
1. Securely requests short-lived credentials from AWS.
2. Runs `terraform init` and `terraform apply -auto-approve` to ensure infrastructure is up to date.
3. Syncs the contents of the `/frontend` directory up to the designated S3 Website bucket.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.