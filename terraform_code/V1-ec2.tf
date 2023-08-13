provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5OSCIP5KQJOPCZN7"
  secret_key = "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"
}
resource "aws_instance" "web" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  key_name = "dpp"
}
