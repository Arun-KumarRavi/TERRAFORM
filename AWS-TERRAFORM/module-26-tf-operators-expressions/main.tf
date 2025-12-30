terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}


variable "num_list" {
  type    = list(number)
  default = [1, 2, 3]
}

variable "person_list" {
  type = list(object({
    name = string
    age  = number
  }))
  default = [
    { name = "John", age = 30 },
    { name = "Jane", age = 25 },
    { name = "Jony", age = 40 }
  ]
}

variable "map_list" {
  type = map(number)
  default = {
    name = 1
    age  = 2
  }
}


locals {
  # Basic arithmetic and comparison
  mul       = 2 * 2
  add       = 2 + 2
  sub       = 2 - 2
  div       = 2 / 2
  not_equal = 2 != 3

  # List comprehensions
  double = [for i in var.num_list : i * 2]
  odd    = [for i in var.num_list : i if i % 2 != 0]

  # Extract names from person_list
  names = [for p in var.person_list : p.name]

  # Work with map_list (order not guaranteed)
  map_values = [for k, v in var.map_list : v]
  double_map = [for k, v in var.map_list : v * 2]
}

