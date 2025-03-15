resource "aws_vpc" "vpc1" {
  cidr_block = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
   tags = merge(local.common_tags, {
    Name = "VPC1"
  })
}


resource "aws_vpc" "vpc2" {
  cidr_block = "10.2.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
   tags = merge(local.common_tags, {
    Name = "VPC2"
  })
}

resource "aws_internet_gateway" "vpc1-IGW" {
  vpc_id = aws_vpc.vpc1.id
}

resource "aws_internet_gateway" "vpc2-IGW" {
  vpc_id = aws_vpc.vpc2.id
}


resource "aws_subnet" "vpc1_subnets" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.1.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"  
}

resource "aws_subnet" "vpc2_subnets" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.2.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"  
}



resource "aws_route_table" "vpc1_RT" {
  vpc_id = aws_vpc.vpc1.id
}

resource "aws_route_table" "vpc2_RT" {
  vpc_id = aws_vpc.vpc2.id
}

resource "aws_route_table_association" "vpc1-RT-ass" {
  subnet_id = aws_subnet.vpc1_subnets.id
  route_table_id = aws_route_table.vpc1_RT.id
}

resource "aws_route_table_association" "vpc2-RT-ass" {
  subnet_id = aws_subnet.vpc2_subnets.id
  route_table_id = aws_route_table.vpc2_RT.id
}

resource "aws_vpc_peering_connection" "vpc1-to-vpc2" {
  vpc_id = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.vpc2.id
  auto_accept = true
  tags =merge(local.common_tags,{
    Name = "vpc1-to-vpc2"
  })
}

resource "aws_route" "route_vpc1-to-vpc2" {
  route_table_id = aws_route_table.vpc1_RT.id
  destination_cidr_block = "10.2.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1-to-vpc2.id
}

resource "aws_route" "route_vpc2-to-vpc1" {
  route_table_id = aws_route_table.vpc2_RT.id
  destination_cidr_block = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1-to-vpc2.id
}
