variable "environment" {
  type        = string
  description = "Environment name (dev, test, prod)"
}

variable "instance_types" {
  type = map(string)
  default = {
    dev  = "t2.micro"
    test = "t2.nano"
    prod = "t2.large"
  }
}
