provider "aws" {
  
}
variable "test" {
  type = string
  default = "gang"
}
resource "aws_instance" "sid" {
  ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    count = var.test == "prod" ? 3 : 1
    tags = {
      Name = "sid-instance"
    }
}