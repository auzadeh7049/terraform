provider "aws" {}

# resource "resource name" "variable name"
resource "aws_vpc" "terraform-lab-vpc" {
  cidr_block = var.vpc_cidr_block
  # add tags for your resources
  tags = {
    Name : "Terraform lab"
  }
}
# you can define many attributions in a variable
variable "subnet_cider_block" {
  description = "subnet cidr block"
  type        = string # type can also be numbers, list, obj,etc
  default     = "10.0.80.0/24"
}
# create a subnet
resource "aws_subnet" "terrafrom-lab-subnet1" {
  # vpc_id is got from resource aws_vpc
  vpc_id            = aws_vpc.terraform-lab-vpc.id
  cidr_block        = var.subnet_cidr_block1
  availability_zone = "us-east-1a"
  tags = {
    Name : "Terraform lab"
  }
}
resource "aws_subnet" "terrafrom-lab-subnet2" {
  vpc_id            = aws_vpc.terraform-lab-vpc.id
  cidr_block        = var.subnet_cidr_block2
  availability_zone = "us-east-1b"
  tags = {
    Name : "Terraform lab"
  }
}
# Data Sources
# Data resource is also provided by providers.
# Data resource corresponds to resources
# We use it to query attributes of existing infrastructure
data "aws_vpc" "my-default-vpc" {
  default = true
}

output "terraform-lab-vpc-id" {
  value = aws_vpc.terraform-lab-vpc.id
}
