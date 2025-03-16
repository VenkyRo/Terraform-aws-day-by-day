terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "blogify-bucket-statefile"
    key            = "blogify-project-dev/terraform.state"
    region         = "us-east-1"
    encrypt        = true
    # dynamodb_table = "terraform-lock" # Optional: Enables state locking
  }
}

provider "aws" {
  region = "us-east-1"
}
