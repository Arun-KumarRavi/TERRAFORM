
# Outputs
output "subnet_ids_all" {
  value = aws_subnet.tf_vpc_subnet[*].id
}

output "instance_subnet_map" {
  value = {
    for i in aws_instance.ec2_instance :
    i.tags["Name"] => i.subnet_id
  }
}
