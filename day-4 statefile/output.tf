output "public_ip" {
  value = aws_instance.name.public_ip
} #public_ip = "184.72.133.52"
output "private_ip" {
  value = aws_instance.name.private_ip
} #private_ip = "172.31.94.50"
output "az" {
  value = aws_instance.name.availability_zone
} #az = "us-east-1a"
output "subnet_id" {
  value = aws_instance.name.subnet_id
} #subnet_id = "subnet-0c8c8c0e77dab1a72"