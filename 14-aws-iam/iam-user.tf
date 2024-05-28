resource "aws_iam_user" "admin-user" {
  name = "sunggon"
  tags = {
    description = "Technical Team Leader"
  }
}

resource "aws_iam_policy" "admin-user-policy" {
  name = "AdminUsers"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "sunggon-admin-access" {
  user = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.admin-user-policy.arn
}