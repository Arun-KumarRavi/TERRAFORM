terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.27.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {
  region = var.region
}

# Random provider resource
resource "random_id" "rand_id" {
  byte_length = 10
}

# S3 bucket using random value
resource "aws_s3_bucket" "bucket" {
  bucket = "my-demo-bucket-${random_id.rand_id.hex}"

  tags = {
    Name        = "my-demo-bucket"
    Environment = "Dev"
  }
}
