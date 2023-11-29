variable "vpc_name" {

}

variable "vpc_cidr_block" {
  description = "cidr block for vpc"
}

variable "igw_name" {
  description = "the internet gateway name"

}

variable "route_table_name" {
  description = "the route table name"

}

variable "subnet_name" {
  description = "the subnet name"

}

variable "subnet_cidr_block" {
  description = "cidr block for public subnet"
}
