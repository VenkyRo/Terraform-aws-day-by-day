output "aws_vpc_id" {
  value = module.vpc.aws_vpc_id
}

output "aws_azs_names" {
  value = module.vpc.aws_azs_names
}

output "aws_public_RT_id" {
  value = module.vpc.aws_public_RT_id
}

output "aws_private_RT_id" {
  value = module.vpc.aws_private_RT_id
}


output "aws_sg_id" {
  value = module.vpc.blogify_sg_id
}


output "lanuch_template_id" {
    value = module.blogify_launch_template.lanuch_template_id
}
output "lanuch_template_arn" {
  value = module.blogify_launch_template.lanuch_template_arn
}

output "lanuch_template_ami_id" {
  value = module.blogify_launch_template.lanuch_template_ami_id
}
