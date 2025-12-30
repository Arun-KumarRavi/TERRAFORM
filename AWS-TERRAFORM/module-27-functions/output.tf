# first 4 characters (index 0..3)
output "output_5" {
  value = substr(local.value, 0, 4)   # "hell"
}

# string length
output "output_6" {
  value = length(local.value)         # 13
}

# split into a list by ", " (comma + space)
output "output_7" {
  value = split(", ", local.value)    # ["hello", "world"]
}


# maximum of given numbers
output "output_8" {
  value = max(1, 8, 2, 3, 9, 0, 10)   # 10
}

# minimum of given numbers
output "output_9" {
  value = min(1, 8, 2, 3, 9, 0, 10)   # 0
}

# set removes duplicates; order is not guaranteed
output "output_14" {
  value = toset(var.string_list)  # ["server1", "server2", "server3"]
}

output "output_14_sorted" {
  value = sort(tolist(toset(var.string_list)))  # ["server1","server2","server3"]
}
