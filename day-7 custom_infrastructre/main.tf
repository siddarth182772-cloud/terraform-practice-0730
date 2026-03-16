resource "aws_vpc" "dev-09" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-0189"
  }
}
resource "aws_subnet" "public-09_sb1" {
  vpc_id = aws_vpc.dev-09.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public-09_sb1"
  }
  availability_zone = "us-west-2a"
}
resource "aws_subnet" "public-09_sb2" {
  vpc_id = aws_vpc.dev-09.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "public-09_sb2"
  }
  availability_zone = "us-west-2b"
}
resource "aws_subnet" "private-09_sb3" {
  vpc_id = aws_vpc.dev-09.id
  cidr_block = "10.0.3.0/24"
  tags = {
    Name = "private-09_sb3"
  }
  availability_zone = "us-west-2a"
}
resource "aws_subnet" "private-09_sb4"{
    vpc_id=aws_vpc.dev-09.id
    cidr_block="10.0.4.0/24"
    tags = {
        Name = "private-09_sb4"
    }
    availability_zone = "us-west-2b"
}
resource "aws_internet_gateway" "dev-09_igw"{
    vpc_id = aws_vpc.dev-09.id
    tags = {
        Name = "dev-09_igw"
    }
}
resource "aws_route_table" "dev-09_rt" {
  vpc_id = aws_vpc.dev-09.id
  tags ={
      Name = "dev-09_rt"
    }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-09_igw.id
  }
}
resource "aws_route_table_association" "dev-09_rta1" {
  subnet_id = aws_subnet.public-09_sb1.id
  route_table_id = aws_route_table.dev-09_rt.id
}
resource "aws_route_table_association" "dev-09_rta2" {
  subnet_id = aws_subnet.public-09_sb2.id
  route_table_id = aws_route_table.dev-09_rt.id
  
}
resource "aws_security_group" "dev-09_sg" {
  name = "dev-09_sg"
  vpc_id = aws_vpc.dev-09.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_eip" "dev-09_eip" {
  domain = "vpc"
  tags = {
    Name = "dev-09_eip"
  }
}
resource "aws_nat_gateway" "dev-09_nat" {
  subnet_id     = aws_subnet.public-09_sb1.id
  allocation_id = aws_eip.dev-09_eip.id
  depends_on = [aws_internet_gateway.dev-09_igw]

  tags = {
    Name = "dev-09_nat"
  }
}
resource "aws_route_table" "dev-09_rt_pvt" {
  vpc_id = aws_vpc.dev-09.id
  tags = {
    Name = "dev-09_rt_pvt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dev-09_nat.id
  }
}
resource "aws_route_table_association" "dev-09_rt_pvt_assoc1" {
  subnet_id = aws_subnet.private-09_sb3.id
  route_table_id = aws_route_table.dev-09_rt_pvt.id
}
resource "aws_route_table_association" "dev-09_rt_pvt_assoc2" {
  subnet_id = aws_subnet.private-09_sb4.id
  route_table_id = aws_route_table.dev-09_rt_pvt.id 
}
resource "aws_instance" "dev-09_web" {
ami = "ami-03caad32a158f72db"
instance_type = "t3.micro"
subnet_id = aws_subnet.public-09_sb1.id
security_groups = [aws_security_group.dev-09_sg.id]
availability_zone = "us-west-2a"
tags = {
    Name = "dev-09_web"
  }
}