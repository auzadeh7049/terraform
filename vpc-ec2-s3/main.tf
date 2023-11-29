
module "vpc" {
  source = "./vpc"

  vpc_name          = module.vpc.vpc_name
  vpc_cidr_block    = module.vpc.vpc_cidr_block
  igw_name          = module.vpc.igw_name
  route_table_name  = module.vpc.route_table_name
  subnet_name       = module.vpc.subnet_name
  subnet_cidr_block = module.vpc.subnet_cidr_block
  dynamodb_table    = module.dynamodb.dynamodb_table_name
  s3-bucket         = module.s3-bucket-name
}
