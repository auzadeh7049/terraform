terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_vpc" "azadeh_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "azadeh-tf-${var.vpc_name}"
  }

}

resource "aws_internet_gateway" "azadeh_igw" {
  vpc_id = aws_vpc.azadeh_vpc.id
  tags = {
    Name = "azadeh-tf-${var.igw_name}"
  }
}

resource "aws_route_table" "azadeh_rtb" {
  vpc_id = aws_vpc.azadeh_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.azadeh_igw.id
  }

  tags = {
    Name = "azadeh-tf-${var.route_table_name}"
  }
}

resource "aws_subnet" "azadeh_subnet" {
  vpc_id                  = aws_vpc.azadeh_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = "azadeh-tf-${var.subnet_name}"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.azadeh_subnet.id
  route_table_id = aws_route_table.azadeh_rtb.id
}
