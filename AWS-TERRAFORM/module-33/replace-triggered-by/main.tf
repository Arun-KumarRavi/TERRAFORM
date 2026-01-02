terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "ami_id" {
  type        = string
  default     = "ami-0ecb62995f68bb549"  # Replace with a valid AMI ID in your region
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"
}

# Example placeholder AMI resource
resource "aws_ami" "my_custom_ami" {
  name                = "my-custom-ami"
  virtualization_type = "hvm"
  root_device_name    = "/dev/sda1"
}

resource "aws_instance" "example_replace" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "example-replace-triggered-by"
  }

  lifecycle {
    replace_triggered_by = [
      aws_ami.my_custom_ami.id # dependency on a resource
    ]
  }
}
