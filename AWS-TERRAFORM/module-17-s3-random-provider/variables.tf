variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to create S3 buckets"
}

variable "bucket1_name" {
  type        = string
  default     = "s3-bucket-1"
  description = "Base name of the first S3 bucket"
}

variable "bucket2_name" {
  type        = string
  default     = "s3-bucket-2"
  description = "Base name of the second S3 bucket"
}

variable "bucket3_name" {
  type        = string
  default     = "s3-bucket-3"
  description = "Base name of the third S3 bucket"
}
