data "aws_subnet" "name" {
    filter {
      name = "tag:Name"
      values = ["room"]
    }
    #data source is used to fetch the existing resource information. Here we are fetching the subnet information based on the tag name "dev"
  
}
data "aws_iam_user" "name" {
    user_name = "siddarth"
    #data source is used to fetch the existing resource information. Here we are fetching the IAM user information based on the user name "dev"
}
output "subnet_id" {
  value = data.aws_subnet.name.id
}
output "iam_user_id" {
  value = data.aws_iam_user.name.id
}