data "aws_availability_zones" "availability_zones" {
    state = "available"
}

data "aws_vpc" "vpc" {
    default = true
}

# data "aws_security_group" "blogify_sg" {
#   vpc_id = aws_vpc.blogify_vpc.id
# }


