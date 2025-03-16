
resource "aws_security_group" "blogify_sg" {
  name = var.sg_name
  description = var.sg_description
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks

    }
  }

  tags = merge(var.commontags, {
    Name = local.sg_name
  })
  
}