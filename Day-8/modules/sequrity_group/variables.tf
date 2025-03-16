variable "sg_name" {
  description = "Security Group name"
  type        = string
}

variable "sg_description" {
  description = "Security Group description"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where SG will be created"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules from tfvars file"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "commontags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Owner       = "Venkatesh"
    Project     = "blogify"
  }
}
