resource "aws_iam_account_password_policy" "password_policy" {
  minimum_password_length     = 8
  require_uppercase_characters = true
  require_lowercase_characters = true
  require_numbers             = true
  require_symbols             = true
  max_password_age            = 90
  password_reuse_prevention   = 5
}

resource "aws_iam_group" "groups" {
  for_each = toset(local.group_names)
  name     = each.value
}

resource "aws_iam_user" "users" {
  for_each = toset(local.users_names)
  name     = each.value
}

resource "aws_iam_user_group_membership" "user_groups" {
  for_each = local.user_group_pairs
  user     = each.value.user
  groups   = [each.value.group]

  depends_on = [
    aws_iam_user.users,
    aws_iam_group.groups
  ]
}

resource "aws_iam_group_policy_attachment" "group_policies" {
  for_each = {
    for idx, item in local.group_policy_pairs :
    "${item.group}-${idx}" => item
  }

  group      = each.value.group
  policy_arn = each.value.policy

  depends_on = [
    aws_iam_group.groups
  ]
}

resource "aws_iam_user_policy_attachment" "user_policies" {
  for_each = {
    for idx, item in local.user_policy_pairs :
    "${item.user}-${idx}" => item
  }

  user       = each.value.user
  policy_arn = each.value.permission

  depends_on = [
    aws_iam_user.users
  ]
}

resource "aws_iam_user_login_profile" "login" {
  for_each = aws_iam_user.users
  user     = each.value.name
  password_reset_required = true
}

resource "aws_iam_access_key" "keys" {
  for_each = aws_iam_user.users
  user     = each.value.name
}
