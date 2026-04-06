resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
      Name = "Sid-server-4547"
    }
}
