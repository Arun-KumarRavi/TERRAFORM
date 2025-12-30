output "vpc_id" {
  description = "Display the VPC ID"
  value       = aws_vpc.vpc_main.id
}

locals {
  public_subnet_output = {
    for key, _ in local.public_subnets : key => {
      subnet_id        = aws_subnet.subnets_main[key].id
      availability_zone = aws_subnet.subnets_main[key].availability_zone
    }
  }

  private_subnet_output = {
    for key, _ in local.private_subnets : key => {
      subnet_id        = aws_subnet.subnets_main[key].id
      availability_zone = aws_subnet.subnets_main[key].availability_zone
    }
  }
}

output "public-subnet-ids" {
  description = "list of public subnet ids"
  value       = local.public_subnet_output
}

output "private-subnet-ids" {
  description = "list of private subnet ids"
  value       = local.private_subnet_output
}
