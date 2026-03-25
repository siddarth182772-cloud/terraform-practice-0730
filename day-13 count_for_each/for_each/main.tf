# In simple terms, the difference between `count` and `for_each` in Terraform is about **how resources are tracked and managed**.
# With `count`, resources are created using **index numbers (0, 1, 2, …)**, so if you change the list (like removing "dev"), 
# Terraform may **shift indexes and recreate resources**, which can accidentally delete or rename existing instances.
# On the other hand, `for_each` uses **unique keys (like "dev", "prod")**, so each resource is tied to a specific name, and changes 
# (like removing "dev") only affect that exact instance without disturbing others. In short, `count` is simpler but risky 
# for dynamic lists, while `for_each` is safer and more stable for managing resources with unique identities.
variable "ami_id" {
    description = "passing values to ami_id"
    default = ""
    type = string
  
}
variable "instance_type" {
    description = "passing values to instance_type"
    default = ""
    type = string
  
}
variable "env" {
    description = "environment name"
    default =[ "dev", "prod" ]
    type = list(string)
}

resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    for_each = toset(var.env) #so here toset is used to convert list to set because for_each only accepts map and set not list
     tags = {
        Name = each.key  #so here we are creating 3 instances with different name
}
}