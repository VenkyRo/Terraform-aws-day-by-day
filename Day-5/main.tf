provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_user" "sirisetty_user" {
  name = var.iam_user_name
# name = local.user_name  #fetch existing user form aws
  path = "/"
}

resource "aws_iam_access_key" "sirisetty_user_AcKey" {
  user = aws_iam_user.sirisetty_user.name
}


#different styles of policy attach by user
#attach multiple AWS managed policies
resource "aws_iam_user_policy_attachment" "aws_s3_policy" {
  user = aws_iam_user.sirisetty_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
#attach multiple AWS managed policies
resource "aws_iam_user_policy_attachment" "aws_ec2_read_policy" {
  user = aws_iam_user.sirisetty_user.name
  policy_arn = "arn:aws:iam::600627360563:policy/venky_iam_ec2_readonlypolicy"
}

# create custom inline policies, use aws_iam_user_policy
resource "aws_iam_user_policy" "aws_ec2_policy" {
  name = "customInlinePolicy"
  user = aws_iam_user.sirisetty_user.name
   policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["ec2:DescribeInstances"]
        Resource = "*"
      }
    ]
  })
}

# many managed policies attachment
resource "aws_iam_user_policy_attachment" "multiple_policies" {
  for_each   = toset(var.arn_policys)
  user       = aws_iam_user.sirisetty_user.name
  policy_arn = each.value
}