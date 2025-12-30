terraform {}

locals {
  value = "hello , world"
}

# uppercase
output "output_1" {
  value = upper(local.value)   # "HELLO , WORLD"
}

# lowercase
output "output_2" {
  value = lower(local.value)   # "hello , world"
}

# starts with "hello"
output "output_3" {
  value = startswith(local.value, "hello")   # true
}

# ends with "world"
output "output_4" {
  value = endswith(local.value, "world")     # true
}


variable "string_list" {
  type    = list(string)
  default = ["server1", "server2", "server3", "server1"]
}

# list length (counts duplicates)
output "output_10" {
  value = length(var.string_list)     # 4
}

# join with "-" (keeps duplicates)
output "output_11" {
  value = join("-", var.string_list)  # "server1-server2-server3-server1"
}

# membership test
output "output_12" {
  value = contains(var.string_list, "server1")   # true
}

# show raw list
output "output_13" {
  value = var.string_list
}
