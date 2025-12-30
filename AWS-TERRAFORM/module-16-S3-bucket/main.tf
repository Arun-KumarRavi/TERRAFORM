terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "buckets" {
  count = length(var.bucket_names)
  bucket = var.bucket_names[count.index]

  tags = {
    Name        = var.bucket_names[count.index]
    Environment = "Dev"
  }
}
