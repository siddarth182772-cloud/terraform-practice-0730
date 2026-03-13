terraform {
  backend "s3" {
    bucket = "amazon-0703"
    key    = "terraform_day6-backend/terraform.tfstate"
    region = "us-east-1"
     # Enable S3 native locking
    #use_lockfile = true   #tf version should be above 1.10
    # The dynamodb_table argument is no longer needed
    dynamodb_table = "role-table-09"

  }
}
