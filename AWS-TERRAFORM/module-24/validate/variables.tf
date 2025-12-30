variable "instance_type" {
  type        = string
  description = "EC2 instance type"

  validation {
    condition     = var.instance_type == "t2.micro" || var.instance_type == "t2.nano"
    error_message = "The instance type must be t2.micro or t2.nano"
  }
}
