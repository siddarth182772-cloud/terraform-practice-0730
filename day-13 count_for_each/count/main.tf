variable "ami_id" {
    description = "passing values to ami_id"
    default = ""
    type = string  
}
variable "ami_instance_type" {
  description = "passing values to instance_type"
  default = ""
  type = string
 }
# resource "aws_instance" "name" {
#   ami = var.ami_id
#   instance_type = var.ami_instance_type
#   count = 2
# #   tags = {
# #     Name = "dev-instance"
# #   }
# # here we are using only one tag but we have same tag sowe will be getting same name for both the instances so to avoid this we will use count.index to give different name to each instance
# tags = {
#     Name = "dev-instance-${count.index}"
#   }
# }
variable "env" {
  description = "environment  name"
  default = ["dev","prod"]
  type = list(string)
}
resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.ami_instance_type
  count = length(var.env)
  tags = {
    Name =var.env[count.index]
  }
}
# here we are using count to create multiple instances and we are using count.index to give different name to each instance based on the environment name which we have defined in the variable env as a list of strings.