provider "aws" {
  region = "eu-west-2"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "test-lambda-function.zip"
  function_name = "test-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.test"

  source_code_hash = filebase64sha256("test-lambda-function.zip")

  runtime = "nodejs14.x"

  environment {
    variables = {
      BASE_URL = "https://www.test.com"
    }
  }
}
