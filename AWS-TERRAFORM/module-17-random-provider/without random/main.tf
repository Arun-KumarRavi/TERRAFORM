terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.27.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-static-demo-bucket"

  tags = {
    Name        = "my-static-demo-bucket"
    Environment = "Dev"
  }
}
