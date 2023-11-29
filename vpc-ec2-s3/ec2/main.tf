terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}



resource "aws_security_group" "azadeh_sg" {
  name        = "azadeh-tf-${var.security_group_name}"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.azadeh_vpc.id

  ingress {
    description = "ssh from anywhere"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "access webserver from anywhere"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "azadeh-tf-${var.security_group_name}"
  }
}

resource "aws_instance" "azadeh_tf_ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.keypair_name
  subnet_id                   = aws_subnet.azadeh_subnet.id
  vpc_security_group_ids      = [aws_security_group.azadeh_sg.id]
  user_data                   = data.template_file.azadeh_cloud_init.rendered

  tags = {
    Name = "azadeh-tf-ec2-ubuntu"
  }
}
