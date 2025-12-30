terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.75.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-0453bc7514f4f99a4"   # Amazon Linux 2
  instance_type = var.instance_type

  tags = {
    Name = "Validated-EC2"
  }
}

#terraform apply -var="instance_type=t2.micro"
#terraform apply -var="instance_type=t2.nano" 
#terraform apply -var="instance_type=m5.large"
