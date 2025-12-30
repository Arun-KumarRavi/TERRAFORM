
# Outputs to validate subnets
output "subnet_ids_first" {
  value = aws_subnet.tf_vpc_subnet[0].id
}

output "subnet_ids_all" {
  value = aws_subnet.tf_vpc_subnet[*].id
}
