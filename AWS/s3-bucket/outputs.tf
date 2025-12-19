output "bucket1_name" {
  value       = aws_s3_bucket.bucket1.bucket
  description = "First S3 bucket name"
}

output "bucket2_name" {
  value       = aws_s3_bucket.bucket2.bucket
  description = "Second S3 bucket name"
}

output "bucket3_name" {
  value       = aws_s3_bucket.bucket3.bucket
  description = "Third S3 bucket name"
}
