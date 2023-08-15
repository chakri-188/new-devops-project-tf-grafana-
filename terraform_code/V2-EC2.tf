provider "aws" {
  region = "us-east-1"
  access_key = "AKIAX4Z62FLW25GGYMEA"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  key_name = "dpp"
  vpc_security_group_ids = ["demo-sg"]
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH access"
  
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"
  }
}