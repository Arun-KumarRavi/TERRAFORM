variable "bucket_name" {
  description = "Unique S3 bucket name for static website"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

