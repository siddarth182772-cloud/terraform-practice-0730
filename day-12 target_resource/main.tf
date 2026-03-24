provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "name" {
  ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    tags = {
      Name = "sid-instance"
    }
}
resource "aws_s3_bucket" "name" {
 bucket= "Siddarth_bucket" 
}

# In Terraform, the -target option is used to apply changes to only one specific resource instead of the whole project. 
# It is useful when you want to test or fix just one part. For example, if you want to create only an EC2 instance, you 
# can run terraform apply -target=aws_instance.sid, and Terraform will apply changes only to that instance and ignore other resources for now.
#  