terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2_1" {
  ami           = var.ami_id_1
  instance_type = var.instance_type_1
  tags = {
    Name = var.instance_name_1
  }
}

resource "aws_instance" "myec2_2" {
  ami           = var.ami_id_2
  instance_type = var.instance_type_2
  tags = {
    Name = var.instance_name_2
  }
}
