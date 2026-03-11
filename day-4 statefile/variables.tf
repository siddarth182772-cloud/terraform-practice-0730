variable "ami_id" {
  type = string
  description = "The ID of the AMI to use for the instance"
  default = ""
}
variable "instance_type" {
  type = string
  description = "The type of instance to create"
  default = ""
}
#we have added subnet_id variable in variables.tf file and we are giving subnet id manually in dev.tfvars file if we give subnet id then it will not create new subnet it will use existing subnet and launch the instance in that subnet
variable "subnet_id" {
  type = string
  description = "Givinig subnet manually"
  default = ""
}