resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tf-vpc"
  }
}
resource "aws_subnet" "name" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.name.id
}