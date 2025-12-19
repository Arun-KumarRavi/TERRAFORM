variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "ami" {
  type        = string
  default     = "ami-0453ec754f44f9a4a"
  description = "AMI ID"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "instance_name" {
  type        = string
  default     = "myec2"
  description = "Tag name for the EC2 instance"
}
