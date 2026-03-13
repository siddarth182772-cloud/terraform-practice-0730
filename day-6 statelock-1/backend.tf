terraform {
  backend "s3" {
    bucket = "amazon-0703"
    key    = "terraform_day6-1/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
