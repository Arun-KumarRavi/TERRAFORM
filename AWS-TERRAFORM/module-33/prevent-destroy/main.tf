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

resource "aws_s3_bucket" "example" {
  bucket = "my-important-bucket-1646461"

  tags = {
    Name        = "critical-bucket-1646461"
    Environment = "dev"
  }

  lifecycle {
    prevent_destroy = true
  }
}
