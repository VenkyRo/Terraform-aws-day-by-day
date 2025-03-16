output "sg_id" {
  value = aws_security_group.blogify_sg.id
}

output "sg_vpc_id" {
  value = aws_security_group.blogify_sg.vpc_id
}