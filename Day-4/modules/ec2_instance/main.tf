provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  default = "value"
}

variable "instance_type" {
  description = "value"

}

resource "aws_instance" "server1" {
  ami = var.ami
  instance_type = var.instance_type
}