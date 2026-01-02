terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

# Base bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "awsedrftgyh-12w3e4r5t"
}

# Bucket policy
resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "AllowFullAccessToUser",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::123456789012:user/YourIAMUser"
        },
        "Action": "s3:*",
        "Resource": [
          "arn:aws:s3:::awsedrftgyh-12w3e4r5t",
          "arn:aws:s3:::awsedrftgyh-12w3e4r5t/*"
        ]
      }
    ]
  }
  POLICY
}

# Versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ACL (private by default)
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

# Lifecycle rule (example: delete old versions after 30 days)
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}
