
# Outputs to validate subnets
output "subnet_ids_first" {
  value = aws_subnet.tf_vpc_subnet[0].id
}

output "subnet_ids_all" {
  value = aws_subnet.tf_vpc_subnet[*].id
}


# Map instance name to subnet ID
output "instance_subnet_map" {
  value = {
    for i in aws_instance.ec2_instance :
    i.tags["Name"] => i.subnet_id
  }
}

# Show all subnet IDs again
output "all_subnet_ids_again" {
  value = aws_subnet.tf_vpc_subnet[*].id
}
