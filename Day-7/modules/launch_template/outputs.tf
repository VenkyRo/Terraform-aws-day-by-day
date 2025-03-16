output "lanuch_template_id" {
    value = aws_launch_template.this.id
}

output "lanuch_template_arn" {
  value = aws_launch_template.this.arn
}

output "lanuch_template_ami_id" {
  value = aws_launch_template.this.image_id
}
