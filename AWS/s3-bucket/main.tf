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

# S3 Buckets
resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket1_name
}

resource "aws_s3_bucket" "bucket2" {
  bucket = var.bucket2_name
}

resource "aws_s3_bucket" "bucket3" {
  bucket = var.bucket3_name
}

# Upload sample file to bucket1
resource "aws_s3_object" "mydata" {
  bucket = aws_s3_bucket.bucket1.bucket
  key    = "mydata.txt"
  source = "${path.module}/mydata.txt"
}

# Upload PDF file to bucket1
resource "aws_s3_object" "mypdf" {
  bucket = aws_s3_bucket.bucket1.bucket
  key    = "sample.pdf"
  source = "${path.module}/sample.pdf"
  content_type = "application/pdf"
}
