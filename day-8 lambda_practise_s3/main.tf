resource "aws_s3_bucket" "bckt_09" {
  bucket = "bckt-09"
  region = "us-east-1"
}
resource "aws_s3_object" "app.zip" {
  bucket = aws_s3_bucket.bckt_09.bucket
  key = "project/app.zip"
  source = "app.zip"
  etag = filemd5("app.zip")
  
}
resource "aws_iam_role" "s3_lambda_role" {
  name = "s3_lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
  
}
resource "aws_iam_role_policy_attachment" "s3_lambda_policy" {
  role = aws_iam_role.s3_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
resource "aws_lambda_function" "s3_lambda_function" {
  function_name = "s3_lambda_function"
  role = aws_iam_role.s3_lambda_role.arn
  handler = "index.handler"
  runtime = "python3.12"
  filename = "app.zip"
  source_code_hash = filebase64sha256("app.zip")
}