output "access_key_id" {
  value = aws_iam_access_key.sirisetty_user_AcKey.id
}

output "sceret_key_id" {
  value = aws_iam_access_key.sirisetty_user_AcKey.secret
  sensitive = true
}

output "siris_user_arn" {
  value = data.aws_iam_user.siris_user.arn
}

output "siris_user_id" {
  value = data.aws_iam_user.siris_user.user_id
}

#fetch existing user form aws
output "siris_user_name" {
  value = data.aws_iam_user.siris_user.user_name
}
