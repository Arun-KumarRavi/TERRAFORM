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

# First bucket
resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket1_name
}

# Second bucket
resource "aws_s3_bucket" "bucket2" {
  bucket = var.bucket2_name
}

# Third bucket
resource "aws_s3_bucket" "bucket3" {
  bucket = var.bucket3_name
}

# Upload sample file to bucket1
resource "aws_s3_object" "upload_file" {
  bucket = aws_s3_bucket.bucket1.bucket
  key    = "mydata.txt"
  source = "${path.module}/mydata.txt"
}
