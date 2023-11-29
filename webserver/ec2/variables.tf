# declare and intialize variables here

variable "instance_type" {
  description = "the ec2 instance type to launch instances as"
  default     = "t2.micro"
}

variable "keypair_name" {
  description = "the ssh public keypair to use when launching ec2 instances"
  default     = "as-key"
}

variable "ssh_port" {
  description = "port for incoming ssh connection"
  default     = 22
}

variable "http_port" {
  description = "port for allowing http access"
  default     = 80
}
