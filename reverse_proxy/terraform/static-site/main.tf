terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
  profile = var.profile
}

resource "aws_instance" "site" {
  ami = "ami-02248c9d6ba0b9e12"
  instance_type = "t2.micro"
  key_name = "devops"
  vpc_security_group_ids = ["sg-0efc11899f945c472"]

  tags = {
    Name = var.name
    group = var.group
  }
}