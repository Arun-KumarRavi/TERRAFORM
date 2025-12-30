terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }

  # Configure remote state backend
  backend "s3" {
    bucket         = "my-terraform-state"        # S3 bucket name
    key            = "state/terraform.tfstate"   # Path inside bucket
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"      # For state locking
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

# S3 bucket for remote state
resource "aws_s3_bucket" "state_bucket" {
  bucket = "my-terraform-state"

  tags = {
    Name = "TerraformStateBucket"
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "lock_table" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "TerraformLockTable"
  }
}
