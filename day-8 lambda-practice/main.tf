resource "aws_iam_role" "lambda_role_9" {
    name = "lambda_role_9"
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
    Action = "sts:AssumeRole"
    Effect = "Allow"
    Principal = {
      Service = "lambda.amazonaws.com"
    }
  }]
})
}
resource "aws_iam_role_policy_attachment" "lambda_policy" {
    role =aws_iam_role.lambda_role_9.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole" 
}
resource "aws_lambda_function" "lambda_function_9" {
    function_name = "lambda_function_9"
    role = aws_iam_role.lambda_role_9.arn
    handler = "index.handler"
    runtime = "python3.12"
    filename = "app.zip"
    source_code_hash = filebase64sha256("app.zip")
}