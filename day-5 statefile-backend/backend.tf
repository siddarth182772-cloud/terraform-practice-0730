terraform {
  backend "s3" {
    bucket = "role-09"
    key    = "terraform_day5/terraform.tfstate"
    region = "us-east-1"
  }
}
