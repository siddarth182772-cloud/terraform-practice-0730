variable "allowed_ports" {
  type = map(string)
  default = {
    22 = "185.67.78.49/32"
    80 = "0.0.0.0/0"
    443 = "0.0.0.0/0"
    9000  = "10.0.0.0/16"
    8080  = "172.16.0.0/16"
  }
}
resource "aws_security_group" "name" {
    description = "Allow SSH and HTTP"
    name        = "allow_ssh_http"
    dynamic "ingress" {
      for_each = var.allowed_ports
      content {
        description = "Allow traffic on port ${ingress.key}"
        from_port   = ingress.key
        to_port     = ingress.key
        protocol    = "tcp"
        cidr_blocks = [ingress.value]
      }
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "my-project-09"
    }
  
}