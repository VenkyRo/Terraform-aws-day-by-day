locals {
  Project_Name = var.Project  // blogify
  Env_Name     = var.Env      // Dev
  Full_Name    = "${local.Project_Name}-${local.Env_Name}"  // blogify-Dev
}

locals {
  azs = slice(data.aws_availability_zones.availability_zones.names,0,2)
}


locals {
  subnet_map = { for idx, subnet in aws_subnet.public_subnets : "subnet-${idx + 1}" => subnet }
}