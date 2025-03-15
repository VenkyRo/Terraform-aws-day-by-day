#fetch existing user form aws
data "aws_iam_user" "siris_user" {
  user_name = "sirisettyvenkatesh"
}