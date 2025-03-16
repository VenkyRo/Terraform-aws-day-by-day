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
  value = module.sg.sg_id
}


output "aws_lanuch_template_id" {
    value = module.launch_template.lanuch_template_id
}
output "aws_lanuch_template_arn" {
  value = module.launch_template.lanuch_template_arn
}

output "aws_lanuch_template_ami_id" {
  value = module.launch_template.lanuch_template_ami_id
}
