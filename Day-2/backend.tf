terraform {
  backend "s3" {
    bucket = "sirisetty-s3-bucket-in"
    region = "us-east-1"
    key = "sirisetty/terraform.tfstate"
    dynamodb_table = "terraform_lock"
  }
}
