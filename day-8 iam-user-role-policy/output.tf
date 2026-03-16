output "aws_access_key" {
  value = aws_iam_access_key.siddarth_access_key.id
}
output "aws_secret_key" {
  value = aws_iam_access_key.siddarth_access_key.secret
  sensitive = true
}