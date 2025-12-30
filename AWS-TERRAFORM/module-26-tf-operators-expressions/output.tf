output "arithmetic" {
  value = {
    mul       = local.mul
    add       = local.add
    sub       = local.sub
    div       = local.div
    not_equal = local.not_equal
  }
}

output "list_ops" {
  value = {
    num_list = var.num_list
    double   = local.double
    odd      = local.odd
  }
}

output "people" {
  value = {
    person_list = var.person_list
    names       = local.names
  }
}

output "map_ops" {
  value = {
    map_list   = var.map_list
    map_values = local.map_values
    double_map = local.double_map
  }
}
