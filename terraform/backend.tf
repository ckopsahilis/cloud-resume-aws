terraform {
  backend "s3" {
    # Replace these values with your actual bucket and table names
    # They must exist in eu-north-1 before running terraform init
    bucket         = "christoskopsahilis-tf-state"
    key            = "cloud-resume/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "christoskopsahilis-tf-locks"
    encrypt        = true
  }
}
