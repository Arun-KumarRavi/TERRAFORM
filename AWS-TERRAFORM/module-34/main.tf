############################################
# Terraform & Provider
############################################
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

############################################
# Variables
############################################
variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
  default     = "ami-0ecb62995f68bb549"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

############################################
# EC2 with PRE & POST CONDITIONS
############################################
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "pre-post-condition-demo"
  }

  lifecycle {

    ########################################
    # PRECONDITION
    ########################################
    precondition {
      condition     = startswith(var.ami_id, "ami-")
      error_message = "AMI ID must start with 'ami-'."
    }

    ########################################
    # POSTCONDITION
    ########################################
    # Use `self` to refer to attributes of this resource.
    # For example, check that the instance has a non-empty ID.
    postcondition {
      condition     = self.id != ""
      error_message = "The EC2 instance must have a valid ID after creation."
    }
  }
}
