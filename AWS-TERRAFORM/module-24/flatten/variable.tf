variable "public_subnet_ids" {
  type    = list(string)
  default = ["subnet-111", "subnet-222"]
}

variable "private_subnet_ids" {
  type    = list(string)
  default = ["subnet-333", "subnet-444", "subnet-555"]
}
