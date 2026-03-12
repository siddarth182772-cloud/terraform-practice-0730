output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "subnet1_id" {
  description = "ID of subnet 1"
  value       = aws_subnet.subnet1.id
}

output "subnet2_id" {
  description = "ID of subnet 2"
  value       = aws_subnet.subnet2.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "route_table_id" {
  description = "Route table ID"
  value       = aws_route_table.rt.id
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.sg.id
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of EC2 instance"
  value       = aws_instance.web.public_dns
}
/*
Infrastructure Output Details

vpc_id = vpc-01fce8b5bee4d9775
subnet1_id = subnet-07b5f94fd12237e82
subnet2_id = subnet-0f2b82970eef7ae15
internet_gateway_id = igw-04cd5fb0f4264ec3f
route_table_id = rtb-0fae16a60409e7520
security_group_id = sg-0a05ac73d92873f09
instance_public_ip = 54.190.223.175
*/