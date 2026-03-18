# ---------- VPC ----------
resource "aws_vpc" "dev_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# ---------- Internet Gateway ----------
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# ---------- Public Subnet ----------
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = var.map_public_ip

  tags = {
    Name = var.public_subnet_name
  }
}

# ---------- Private Subnet ----------
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = var.private_subnet_name
  }
}

# ---------- Route Table ----------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = var.route_table_name
  }
}

# ---------- Route ----------
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.internet_cidr
  gateway_id             = aws_internet_gateway.dev_igw.id
}

# ---------- Route Table Association ----------
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_instance" "web_server" {
  ami          = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = var.instance_name
  }
}