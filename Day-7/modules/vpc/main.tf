resource "aws_vpc" "blogify_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
   tags = merge(var.common_tags,{
    Name = "${local.Full_Name}-VPC"
  })
}


resource "aws_internet_gateway" "blogify_IGW" {
  vpc_id = aws_vpc.blogify_vpc.id
   tags = merge(var.common_tags,{
    Name = "${local.Full_Name}-IGW"
  })
}

#createing public subnets
resource "aws_subnet" "public_subnets" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.blogify_vpc.id
    cidr_block = var.public_subnet_cidr[count.index]
    map_public_ip_on_launch = true
    availability_zone = element(local.azs,count.index)
    tags = merge(var.common_tags, {
    Name = "${local.Full_Name}-public-${element(local.azs, count.index)}"
    })

}

#createing public Route
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.blogify_vpc.id
  route {
    cidr_block = var.Internet_cidr
    gateway_id = aws_internet_gateway.blogify_IGW.id
  }
  tags = merge(var.common_tags,{
    Name = "${local.Full_Name}-Public-RT"
  })
}

resource "aws_route_table_association" "public_RT_association" {
    count = length(var.public_subnet_cidr)
    subnet_id = aws_subnet.public_subnets[count.index].id
    route_table_id = aws_route_table.public_RT.id
    depends_on = [aws_route_table.public_RT, aws_subnet.public_subnets]
}

#createing private subnets
resource "aws_subnet" "private_subnets" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.blogify_vpc.id
    cidr_block = var.private_subnet_cidr[count.index]
    map_public_ip_on_launch = true
    availability_zone = element(local.azs,count.index)
    tags = merge(var.common_tags, {
    Name = "${local.Full_Name}-private-${element(local.azs, count.index)}"
    })
}

#createing private Route
resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.blogify_vpc.id
#   route {
#     cidr_block = var.Internet_cidr
#     gateway_id = aws_internet_gateway.blogify_IGW.id
#   }
  tags = merge(var.common_tags,{
    Name = "${local.Full_Name}-Private-RT"
  })
}

#create private Route Table association
resource "aws_route_table_association" "private_RT_association" {
    count = length(var.private_subnet_cidr)
    subnet_id = aws_subnet.private_subnets[count.index].id
    route_table_id = aws_route_table.private_RT.id
}