variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  # default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  # default = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]  
}

variable "private_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  # default = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]   
}



variable "Internet_cidr" {
  description = "CIDR blocks for Internet"
  type = string
  default = "0.0.0.0/0"
}


variable "Project" {
  description = "value"
  type = string
  default = "Blogify"
}

variable "Env" {
  description = "value"
  type = string
  default = "Dev"
}


variable "common_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Owner       = "Venkatesh"
    Project     = "blogify"
  }
}

variable "name_prefix" {
  description = "Prefix for the launch template name"
  type        = string
}

variable "image_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}


variable "volume_size" {
  description = "Size of the EBS volume"
  type        = number
}

variable "volume_type" {
  description = "Type of the EBS volume"
  type        = string
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address"
  type        = bool
}

variable "user_data" {
  description = "Path to the user data script"
  type        = string
}
