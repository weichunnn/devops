terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # specify version
    }
  }
}

provider "aws" {
  profile = var.profile
  region = "ap-southeast-1"
}

resource "aws_db_instance" "default" {
  allocated_storage = 20 
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "13.1"

  instance_class = "db.t2.micro"
  identifier = var.id # instance name

  db_name = "contacts_db" # db name
  username = "postgres"
  password = var.password

  vpc_security_group_ids = ["sg-0d45dfedb3121f892"]
  publicly_accessible = true
  skip_final_snapshot    = true
}