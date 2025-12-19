output "instance_id" {
  value       = aws_instance.myec2.id
  description = "The ID of the EC2 instance"
}

output "instance_public_ip" {
  value       = aws_instance.myec2.public_ip
  description = "The public IP address of the EC2 instance"
}

output "instance_type" {
  value       = aws_instance.myec2.instance_type
  description = "The EC2 instance type used"
}

output "instance_name" {
  value       = aws_instance.myec2.tags["Name"]
  description = "The Name tag of the EC2 instance"
}
