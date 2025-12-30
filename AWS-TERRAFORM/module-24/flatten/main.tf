terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.75.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  all_subnets = flatten([var.public_subnet_ids, var.private_subnet_ids])
}

output "flattened_subnet_list" {
  value = local.all_subnets
}
