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

# Step 1: Generate a new private key locally
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Step 2: Create an AWS key pair using the public key
resource "aws_key_pair" "mykey" {
  key_name   = "mykeypair"
  public_key = tls_private_key.mykey.public_key_openssh
}

# Step 3: Launch EC2 instance with the generated key pair
resource "aws_instance" "myec2" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name

  tags = {
    Name = "Myec2"
  }
}

# Step 4: Output the private key so you can save it locally
output "private_key_pem" {
  value     = tls_private_key.mykey.private_key_pem
  sensitive = true
}
