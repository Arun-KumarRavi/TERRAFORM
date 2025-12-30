##################################
# Terraform & Provider
##################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

##################################
# Data Sources - Existing Resources
##################################

# Default VPC
data "aws_vpc" "default" {
  default = true
}

# Default Subnets (one per AZ)
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Default Security Group
data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

# Amazon Linux 2023 x86_64 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

##################################
# Resource - EC2 Instance
##################################

resource "aws_instance" "ec2_default" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    data.aws_security_group.default.id
  ]

  tags = {
    Name = "ec2-default-vpc"
  }
}

##################################
# Outputs
##################################

output "default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "default_subnet_id" {
  value = data.aws_subnets.default.ids[0]
}

output "default_sg_id" {
  value = data.aws_security_group.default.id
}
