resource "aws_vpc" "name" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "sid-vpc"
  }
}
resource "aws_s3_bucket" "name" {
  bucket = "sid-4547-09"
}
resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.name.id
  versioning_configuration {
    status = "Enabled"
  }
}