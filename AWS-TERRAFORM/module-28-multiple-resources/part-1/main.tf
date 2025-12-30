# Required provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider (replace region as needed)
provider "aws" {
  region = "us-east-1"
}

# Locals for naming
locals {
  project_name = "tf_vpc"
}

# VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = local.project_name
  }
}

# Two subnets using count
# count.index will be 0 and 1 → we’ll derive unique CIDRs and names
resource "aws_subnet" "tf_vpc_subnet" {
  count      = 2
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  tags = {
    Name = "${local.project_name}-subnet-${count.index}"
  }
}
