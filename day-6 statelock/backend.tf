terraform {
  backend "s3" {
    bucket = "amazon-0703"
    key    = "terraform_day6/terraform.tfstate"
    region = "us-east-1"
  }
}
