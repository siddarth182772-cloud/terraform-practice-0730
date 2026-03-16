resource "aws_iam_policy" "siddarth_547_policy" {
  name = "siddarth-547-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      # Allow viewing instances
      {
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances"
        ],
        Resource = "*"
      },
      # Allow start/stop only tagged instance
      {
        Effect = "Allow",
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances"
        ],
        Resource = "*",
        Condition = {
          StringEquals = {
            "ec2:ResourceTag/Name" = "siddarth-547-instance"
          }
        }
      }
    ]
  })
}
resource "aws_iam_user" "siddarth" {
    name ="siddarth-547"    
}
resource "aws_iam_access_key" "siddarth_access_key" {
    user = aws_iam_user.siddarth.name
}
resource "aws_iam_user_policy_attachment" "siddarth_policy_attachment" {
    user = aws_iam_user.siddarth.name
    policy_arn = aws_iam_policy.siddarth_547_policy.arn
}
resource "aws_instance" "siddarth_instance" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    tags = {
        Name = "siddarth-547-instance"
    }
}
resource "aws_secretsmanager_secret" "siddarth_547" {
    name = "siddarth-547-secret"

}
resource "aws_secretsmanager_secret_version" "siddarth_547" {
    secret_id = aws_secretsmanager_secret.siddarth_547.id
    secret_string = jsonencode({
        aws_access_key = aws_iam_access_key.siddarth_access_key.id,
        aws_secret_key = aws_iam_access_key.siddarth_access_key.secret
    })
}
resource "aws_iam_user_login_profile" "siddarth_login_profile" {
    user = aws_iam_user.siddarth.name
    password_reset_required = false
    }
resource "aws_secretsmanager_secret" "login_profile_secret" {
    name = "siddarth-547-login-profile-secret"
}
resource "aws_secretsmanager_secret_version" "login_profile_secret_version" {
    secret_id = aws_secretsmanager_secret.login_profile_secret.id
    secret_string = jsonencode({
        username = aws_iam_user.siddarth.name,
        password = aws_iam_user_login_profile.siddarth_login_profile.password
    })
}