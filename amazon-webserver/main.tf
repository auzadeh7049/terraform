
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

# use amazon-linux image
resource "aws_instance" "app" {
  ami           = "ami-0cf0e376c672104d6"
  instance_type = "t2.micro"

  tags = {
    Name = "azadeh-amazon-tf"
  }
}

resource "aws_instance" "app-2" {
  ami           = "ami-0cf0e376c672104d6"
  instance_type = "t2.micro"

  tags = {
    Name = "rutuja-amazon-tf"
  }
}
