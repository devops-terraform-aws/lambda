resource "random_id" "name" {
  byte_length = 3
}

resource "aws_s3_bucket" "name" {
  bucket = "helloworld-${random_id.name.hex}"
  tags = {
    Name = "helloworld-bucket"
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.name.id
  key    = "hello.zip"
  source = "${path.module}/hello.zip"
}

resource "aws_iam_role" "role" {
  name               = "helloworld_lambda_role"
  assume_role_policy = file("config/lambda_assume_role_policy.json")
}

resource "aws_iam_role_policy" "policy" {
  name   = "helloworld_lambda_policy"
  role   = aws_iam_role.role.id
  policy = file("config/lambda_policy.json")
}

resource "aws_lambda_function" "lambda" {
  function_name = "hello_world"
  s3_bucket     = aws_s3_bucket.name.id
  s3_key        = "hello.zip"
  role          = aws_iam_role.role.arn
  handler       = "hello.handler"
  runtime       = "nodejs18.x"
}