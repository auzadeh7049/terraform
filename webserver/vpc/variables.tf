# declare and intialize variables here
variable "vpc_name" {
  description = "the vpc name"
  default     = "webserver-vpc"
}

variable "vpc_cidr_block" {
  description = "cidr block for vpc"
  default     = "10.0.0.0/16"
}

variable "igw_name" {
  description = "the internet gateway name"
  default     = "webserver-igw"
}

variable "route_table_name" {
  description = "the route table name"
  default     = "webserver-rtb"
}

variable "subnet_name" {
  description = "the subnet name"
  default     = "webserver-subnet"
}

variable "subnet_cidr_block" {
  description = "cidr block for public subnet"
  default     = "10.0.1.0/24"
}
