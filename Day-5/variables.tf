variable "iam_user_name" {
  description = "value"
  type = string
  default ="venkysirisetty"
}


variable "arn_policys" {
  description = "arn policy"
  type = list(string)
  default = [ 
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
}