resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/24"
  tags = {
    #version-1 was tf-vpc
    #version-2 was NAVY-07-vpc
    Name = "RAMSEY-03-vpc"
  }
}
resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = {
    #version-1 was tf-instance
    #version-2 was NAVY-07-instance
    Name = "RAMSEY-03-instance"
  }
}