terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "s3-bucket" {
  source                   = "terraform-aws-modules/s3-bucket/aws"
  version                  = "3.15.1"
  bucket                   = "my-s3-bucket"
  acl                      = "private"
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = false

  }
  tags = {
    Name = "azadeh-s3"
  }
}
