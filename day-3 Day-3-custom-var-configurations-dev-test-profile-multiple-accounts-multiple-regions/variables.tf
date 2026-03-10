variable "ami_id" {
  description = "ami id for default server"
  default = ""
  type = string
}
variable "instance_type" {
  description = "instance type for default server"
  default = ""
  type = string
}
variable "dev_ami_id" {
  description = "ami id for dev-09 server"
  default = ""
  type = string
}
variable "dev_instance_type" {
  description = "instance type for dev-09 server"
  default = ""
  type = string
}
variable "prod_ami_id" {
  description = "ami_id for prod account"
  default = ""
  type = string
}
variable "prod_instance_type" {
  description = "instance type for prod account"
  default = ""
  type = string
}