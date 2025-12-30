terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.78.0"
    }
  }
}
provider "aws" {
  region = var.region
}

resource "aws_instance" "demo" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = var.instance_type

  root_block_device {
    volume_size = var.v_size
  }
}