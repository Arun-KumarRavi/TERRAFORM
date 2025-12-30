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

# Use lookup to safely get instance type
resource "aws_instance" "ec2_instance" {
  ami           = "ami-0453bc7514f4f99a4"   # Amazon Linux 2 in us-east-1
  instance_type = lookup(var.instance_types, var.environment, "t2.micro")

  tags = {
    Name = "EC2-${var.environment}"
  }
}

output "instance_type_used" {
  value = lookup(var.instance_types, var.environment, "t2.micro")
}

output "instance_id" {
  value = aws_instance.ec2_instance.id
}




#terraform apply -var="environment=dev
#terraform apply -var="environment=test
#terraform apply -var="environment=prod