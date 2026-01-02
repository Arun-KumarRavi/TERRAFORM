############################################
# Terraform & Provider
############################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

############################################
# 1️⃣ create_before_destroy
############################################
resource "aws_instance" "create_instance" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"

  tags = {
    Name = "create-before-destroy"
  }

  lifecycle {
    create_before_destroy = true
  }
}

############################################
# 2️⃣ prevent_destroy
############################################
resource "aws_s3_bucket" "protected_bucket" {
  bucket = "monica-prevent-destroy-bucket-12345"

  tags = {
    Name        = "prevent-destroy"
    Environment = "dev"
  }

  lifecycle {
    prevent_destroy = true
  }
}

############################################
# 3️⃣ ignore_changes
############################################
resource "aws_iam_user" "user" {
  name = "monica-user"
}

resource "aws_iam_user_login_profile" "profile" {
  user            = aws_iam_user.user.name
  password_length = 12

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required
    ]
  }
}

############################################
# 4️⃣ replace_triggered_by (CORRECT WAY)
############################################

# Variable that controls replacement
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# Trigger resource
resource "null_resource" "instance_type_change" {
  triggers = {
    instance_type = var.instance_type
  }
}

# EC2 that will be recreated when instance_type changes
resource "aws_instance" "replace_instance" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = var.instance_type

  tags = {
    Name = "replace-triggered-by"
  }

  lifecycle {
    replace_triggered_by = [
      null_resource.instance_type_change
    ]
  }
}
