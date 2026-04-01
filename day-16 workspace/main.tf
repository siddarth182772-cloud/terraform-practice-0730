provider "aws" {
  region = "us-east-1"
  profile = "king"
}
resource "aws_instance" "name" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
}
# In **entity["software","Terraform","infrastructure as code tool"]**, a workspace lets you use the same configuration to manage multiple environments (like dev, test, prod) by keeping separate state files for each, whereas an AWS 
# profile (used with the **entity["software","Terraform AWS Provider","hashicorp aws provider"]**) controls which AWS account or credentials
# Terraform uses; in short, a workspace separates *state (environments)*, while a profile separates *access (accounts)*, and although they can be combined (e.g., mapping workspace names to profiles), they serve fundamentally different purposes.