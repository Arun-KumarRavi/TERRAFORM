output "bucket1_name" {
  value       = aws_s3_bucket.bucket1.bucket
  description = "Randomized S3 bucket name"
}
