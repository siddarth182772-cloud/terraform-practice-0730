resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/26"
  tags = {
    Name = "hero"
  }
}
resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id #we are giving subnet id manually here if we give subnet id then it will not create new subnet it will use existing subnet and launch the instance in that subnet
    tags = {
      Name = "ghost-instance"
    }
}