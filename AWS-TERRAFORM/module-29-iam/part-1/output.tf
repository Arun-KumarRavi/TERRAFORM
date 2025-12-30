output "iam_users" {
  value = local.users_names
}

output "iam_groups" {
  value = local.group_names
}

output "access_keys" {
  value = {
    for k, v in aws_iam_access_key.keys :
    k => {
      access_key = v.id
      secret_key = v.secret
    }
  }
  sensitive = true
}
