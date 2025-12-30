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

resource "aws_instance" "myec2" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"

  key_name = "mykeypair"   # ← THIS is the key attachment

  tags = {
    Name = "Myec2"
  }
}
