output "instance1_public_ip" {
  value       = aws_instance.myec2_1.public_ip
  description = "Public IP of the first EC2 instance"
}

output "instance1_id" {
  value       = aws_instance.myec2_1.id
  description = "ID of the first EC2 instance"
}

output "instance2_public_ip" {
  value       = aws_instance.myec2_2.public_ip
  description = "Public IP of the second EC2 instance"
}

output "instance2_id" {
  value       = aws_instance.myec2_2.id
  description = "ID of the second EC2 instance"
}
