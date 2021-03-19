provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "test_ec2_instance" {
  ami = "ami-12345"
  instance_type = "t2.micro"
  tags = {
    Name = "test"
  }
}
