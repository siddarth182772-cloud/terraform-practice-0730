locals {
  region = "us-east-1"
  ami_id= "ami-02dfbd4ff395f2a1b"
  type ="t2.micro"
}
resource "aws_instance" "name" {
  ami = local.ami_id
  instance_type = local.type
  region = local.region
  tags = {
    Name ="sid-server"
  }
}