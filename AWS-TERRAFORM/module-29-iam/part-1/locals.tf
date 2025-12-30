locals {
  iam_data = yamldecode(file("${path.module}/user.yaml"))

  all_groups = local.iam_data.groups
  all_users  = local.iam_data.users

  group_names = keys(local.all_groups)

  users_names = [
    for user in local.all_users : user.username
  ]

  user_group_pairs = {
    for user in local.all_users :
    user.username => {
      user  = user.username
      group = user.group
    }
  }

  group_policy_pairs = flatten([
    for group_name, group_data in local.all_groups : [
      for policy in group_data.policies : {
        group  = group_name
        policy = policy
      }
    ]
  ])

  user_policy_pairs = flatten([
    for user in local.all_users : [
      for perm in user.permissions : {
        user       = user.username
        permission = perm
      }
    ]
  ])
}
