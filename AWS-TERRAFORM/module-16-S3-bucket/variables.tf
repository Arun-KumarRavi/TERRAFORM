variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to create S3 buckets"
}

variable "bucket1_name" {
  type        = string
  default     = "monica-bucket-1-unique"
  description = "Name of the first S3 bucket"
}

variable "bucket2_name" {
  type        = string
  default     = "monica-bucket-2-unique"
  description = "Name of the second S3 bucket"
}

variable "bucket3_name" {
  type        = string
  default     = "monica-bucket-3-unique"
  description = "Name of the third S3 bucket"
}
