terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "CloudResumeChallenge"
      Environment = "Production"
      ManagedBy   = "Terraform"
    }
  }
}

# Note: CloudFront certificates MUST be requested in us-east-1.
# We set up an aliased provider here for ACME / ACM certificate steps later.
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
