terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

variable "name" {
  default = "server"
  description = "name of the instance deployed"
}

resource "aws_instance" "jenkins_v1" {
  ami = "ami-02ee763250491e04a"
  instance_type = "t2.micro"
  key_name = "devops"

  tags = {
    Name = "jenkins"
  }
}

resource "aws_instance" "web" {
  ami = "ami-02ee763250491e04a"
  instance_type = "t2.micro"
  key_name = "devops"

  tags = {
    Name = "webserver"
  }
}

output "web_ip" {
  value = aws_instance.web.public_ip
}

output "jenkins_ip" {
  value = aws_instance.jenkins_v1.public_ip
}