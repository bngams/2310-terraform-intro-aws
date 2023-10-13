##
# Create IAM users and access keys dynamically
resource "aws_iam_user" "iam_users" {
  for_each = toset(var.user_names)
  name     = each.value
}

resource "aws_iam_access_key" "access_keys" {
  for_each = aws_iam_user.iam_users
  user     = aws_iam_user.iam_users[each.key].name
}
