############################
# S3 BUCKET
############################
resource "aws_s3_bucket" "S3_bucket" {
  bucket = var.bucket_name
}


# DISABLE BLOCK PUBLIC ACCESS
############################
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.S3_bucket.id

  depends_on = [
    aws_s3_bucket.S3_bucket
  ]

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

############################
# BUCKET POLICY (PUBLIC READ)
############################
resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.S3_bucket.id

  depends_on = [
    aws_s3_bucket_public_access_block.public_access
  ]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.S3_bucket.id}/*"
      }
    ]
  })
}

############################
# ENABLE VERSIONING
############################
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.S3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

############################
# STATIC WEBSITE HOSTING
############################
resource "aws_s3_bucket_website_configuration" "site_hosting" {
  bucket = aws_s3_bucket.S3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

############################
# UPLOAD FILES
############################
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.S3_bucket.id
  key          = "index.html"
  source       = "${path.module}/website/index.html"
  content_type = "text/html"

  depends_on = [
    aws_s3_bucket_policy.public_policy
  ]
}