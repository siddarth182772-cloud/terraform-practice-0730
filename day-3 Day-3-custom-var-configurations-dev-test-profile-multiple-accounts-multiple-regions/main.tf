resource "aws_instance" "siddarth" {
  ami           = var.ami_id
  instance_type = var.instance_type 
  tags = {
    Name = "siddarth"
  } 
}
resource "aws_instance" "dev-09" {
  ami           = var.dev_ami_id
  instance_type = var.dev_instance_type 
  provider = aws.devops
  tags = {
    Name = "dev-09"
  } 
}
resource "aws_instance" "prod-09" {
  ami           = var.prod_ami_id
  instance_type = var.prod_instance_type 
  provider = aws.prod
  tags = {
    Name = "prod-09"
  } 
}