# Required provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider (set your region)
provider "aws" {
  region = "us-east-1"   # change to ap-south-1 if you prefer Mumbai
}

# Local naming
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
resource "aws_subnet" "tf_vpc_subnet" {
  count      = 2
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  tags = {
    Name = "${local.project_name}-subnet-${count.index}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "${local.project_name}-igw"
  }
}

# Route table with default route to IGW
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${local.project_name}-rt"
  }
}

# Associate route table with both subnets
resource "aws_route_table_association" "assoc" {
  count          = length(aws_subnet.tf_vpc_subnet)
  subnet_id      = aws_subnet.tf_vpc_subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}

# Security group allowing SSH + all egress
resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.tf_vpc.id
  name   = "${local.project_name}-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Fetch latest Amazon Linux 2 AMI dynamically
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Create 4 EC2 instances, rotating across subnets
resource "aws_instance" "ec2_instance" {
  count         = 4
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  subnet_id     = element(
    aws_subnet.tf_vpc_subnet[*].id,
    count.index % length(aws_subnet.tf_vpc_subnet)
  )
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "${local.project_name}-instance-${count.index}"
  }
}
