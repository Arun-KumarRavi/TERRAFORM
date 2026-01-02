provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  tags = {
    Name = "StateTest"
  }
}

variable "bucket_name" {
  description = "Name of the test S3 bucket"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}
