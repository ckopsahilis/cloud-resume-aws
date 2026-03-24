# Configure OIDC identity provider for GitHub Actions

resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["1b511abead59c6ce207077c0bf0e0043b1382612"] # GitHub's official thumbprint
}

resource "aws_iam_role" "github_actions_role" {
  name = "github-actions-cloud-resume-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            # Restricts to ONLY your repository and branch
            "token.actions.githubusercontent.com:sub" = "repo:ckopsahilis/cloud-resume-aws:*"
          }
        }
      }
    ]
  })
}

# Attach AdministratorAccess (or you can scope this down based on strict principle)
# Note: For this project, Admin access is broadly needed to provision S3, IAM, Gateway, Lambda, DynamoDB, etc.
resource "aws_iam_role_policy_attachment" "github_actions_admin" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "github_actions_role_arn" {
  description = "The ARN of the IAM role for GitHub Actions"
  value       = aws_iam_role.github_actions_role.arn
}