terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

# create s3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "azadeh-test-bucket-tf"

  tags = {
    Name        = "Azadeh terraform s3"
    Environment = "Dev"
  }
}
