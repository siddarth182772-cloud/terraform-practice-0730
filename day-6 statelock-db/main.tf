resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "hello-vpc"
  }
}

resource "aws_subnet" "name" {
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.name.id

  tags = {
    Name = "hello-subnet"
  }
}

resource "aws_subnet" "hero" {
  cidr_block = "10.0.2.0/26"
  vpc_id     = aws_vpc.name.id

  tags = {
    Name = "hello"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.name.id

  tags = {
    Name = "hello-ig"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.name.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "hello-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.name.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.hero.id
  route_table_id = aws_route_table.rt.id
}