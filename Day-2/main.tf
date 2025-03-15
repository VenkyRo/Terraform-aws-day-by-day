provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server1" {
  ami= "ami-04aa00acb1165b32a"
  instance_type = "t2.micro"
}

# resource "aws_s3_bucket" "s3_bucket" {
#   bucket = "sirisetty-s3-bucket-in"
# }

resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockId"
  attribute {
    name = "LockId"
    type = "S"
  }
}