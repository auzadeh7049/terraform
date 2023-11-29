resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  #subnet_id     = "subnet-055c019bc6055e3da"
}
