#fetch existing user form aws
locals {
  user_name = data.aws_iam_user.siris_user.user_name
}