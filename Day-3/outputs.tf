output "vpc1_id" {
  value = aws_vpc.vpc1.id
}

output "vpc2_id" {
  value = aws_vpc.vpc2.id
}

output "sg1" {
  value = aws_security_group.sg_vpc1.id
}

output "sg2" {
  value = aws_security_group.sg_vpc2.id
}


output "av_zones" {
  value = data.aws_availability_zones.avzones.names
}