variable "aws_region" {
  description = "AWS region for primary resources"
  type        = string
  default     = "eu-north-1"
}

variable "domain_name" {
  description = "The root domain name"
  type        = string
  default     = "christoskopsahilis" # e.g., christoskopsahilis.com
}
