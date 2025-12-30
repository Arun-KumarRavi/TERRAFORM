variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0453bc7514f4f99a4"  # Amazon Linux 2 in us-east-1
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  # no default → Terraform will ask or you can pass via -var
}
