terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
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

# Generate random ID
resource "random_id" "rand_id" {
  byte_length = 4   # you can change this number
}

# First bucket with random suffix
resource "aws_s3_bucket" "bucket1" {
  bucket = "${var.bucket1_name}-${random_id.rand_id.dec}"
}

# Second bucket with random suffix
resource "aws_s3_bucket" "bucket2" {
  bucket = "${var.bucket2_name}-${random_id.rand_id.dec}"
}

# Third bucket with random suffix
resource "aws_s3_bucket" "bucket3" {
  bucket = "${var.bucket3_name}-${random_id.rand_id.dec}"
}

