output "aws_vpc_id" {
  value = aws_vpc.blogify_vpc.id
}

output "aws_IGW_id" {
  value = aws_internet_gateway.blogify_IGW.id
}

output "aws_azs_names" {
  value = data.aws_availability_zones.availability_zones.names
}

output "aws_public_subnets_id" {
  value = aws_subnet.public_subnets[*].id
}

output "aws_public_RT_id" {
  value = aws_route_table.public_RT.id
}

output "aws_private_RT_id" {
  value = aws_route_table.private_RT.id
}


output "aws_private_subnets_id" {
  value = aws_subnet.private_subnets[*].id
}

output "blogify_sg_id" {
  value = data.aws_security_group.blogify_sg.id
}