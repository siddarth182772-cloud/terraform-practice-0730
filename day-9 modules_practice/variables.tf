variable "profile" {
  default = "default"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "dev-vpc"
}

variable "igw_name" {
  default = "dev-igw"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_name" {
  default = "public-subnet"
}

variable "map_public_ip" {
  default = true
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "private_subnet_name" {
  default = "private-subnet"
}

variable "route_table_name" {
  default = "public-rt"
}

variable "internet_cidr" {
  default = "0.0.0.0/0"
}
variable "ami_id" {
    default = "ami-02dfbd4ff395f2a1b"  
}
variable "instance_type" {
    default = "t2.micro"
}
variable "instance_name" {
  default = "web-server"
}