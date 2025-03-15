resource "aws_instance" "ec2_vpc1" {
  ami= "ami-04aa00acb1165b32a"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.vpc1_subnets.id
  key_name = "north-linux-key"
  security_groups = [aws_security_group.sg_vpc1.id]
  tags = merge(local.common_tags,{
    Name = "EC2-vpc1"
  })
}

resource "aws_instance" "ec2_vpc2" {
  ami= "ami-04aa00acb1165b32a"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.vpc2_subnets.id
  key_name = "north-linux-key"
  security_groups = [aws_security_group.sg_vpc2.id]
  tags = merge(local.common_tags,{
    Name = "Ec2-vpc2"
  })
}
