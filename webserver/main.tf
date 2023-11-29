module "vpc" {
  source = "./vpc"

  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
}

module "ec2" {
  source = "./ec2"
}
