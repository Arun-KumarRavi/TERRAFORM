provider "aws" {
  region = "us-east-1"
}

locals {
  environment   = "dev"
  instance_type = "t3.micro"
  name_prefix   = "monica-app"
}

resource "aws_instance" "web" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = local.instance_type

  tags = {
    Name        = "${local.name_prefix}-web"
    Environment = local.environment
  }
}
