terraform {
  backend "s3" {
    bucket = "module-bucket-1649785234"   # ✅ your new backend bucket
    key    = "state-test/terraform.tfstate"
    region = "us-east-1"
  }
}
