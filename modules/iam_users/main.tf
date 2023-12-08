##
# Create IAM users 
# resource "aws_iam_user" "demo" {
#   count = var.number_of_users
#   name = "aelion2310.0${count.index}"
# }

##
# Create IAM users and access keys dynamically with a list
resource "aws_iam_user" "iam_users" {
  for_each = toset(var.user_names)
  name = each.value
}

##
# TODO: Policy

resource "aws_iam_access_key" "access_keys" {
  for_each = aws_iam_user.iam_users
  user = aws_iam_user.iam_users[each.key].name
}
