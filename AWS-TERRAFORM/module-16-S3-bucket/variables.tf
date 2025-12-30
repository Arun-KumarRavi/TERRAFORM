variable "region" {
  default = "us-east-1"
}

variable "bucket_names" {
  type    = list(string)
  default = ["monica-bucket-1-20251222", "monica-bucket-2-20251222", "monica-bucket-3-20251222"]
}
