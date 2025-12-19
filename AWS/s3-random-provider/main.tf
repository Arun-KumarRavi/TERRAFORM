provider "aws" {
  region = var.region
}

resource "random_id" "rand_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "s3-random-demo-${random_id.rand_id.hex}"
}
