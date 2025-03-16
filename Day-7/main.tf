module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  Project = var.Project
  Env = var.Env
  common_tags = var.common_tags
}


module "blogify_launch_template" {
  source                  = "./modules/launch_template"
  name_prefix             = var.name_prefix
  image_id                = var.image_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  security_group_ids      = [module.vpc.blogify_sg_id] 
  volume_size             = var.volume_size
  volume_type             = var.volume_type
  associate_public_ip     = var.associate_public_ip
  user_data               = file(var.user_data)
}
