output "vpc_name" {
  value = var.vpc_name
}

output "vpc_cidr_block" {
  value = aws_vpc.azadeh_vpc.cidr_block
}

output "igw_name" {
  value = var.igw_name

}

output "route_table_name" {
  value = var.route_table_name
}

output "subnet_name" {
  value = var.subnet_name
}

output "subnet_cidr_block" {
  value = var.subnet_cidr_block
}
