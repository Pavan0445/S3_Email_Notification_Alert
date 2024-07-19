resource "aws_lambda_function" "my_lambda" {
  filename      = var.filename
  function_name = var.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.handler
  runtime       = var.runtime

  environment {
    variables = {
      SENDER_EMAIL = var.SENDER_EMAIL
      RECIPIENT_EMAIL = var.RECIPIENT_EMAIL
    }
  }

  source_code_hash = filebase64sha256(var.filename)
}


resource "aws_lambda_permission" "S3_as_trigger" {
statement_id  = var.statement_id
action        = var.action
function_name = aws_lambda_function.my_lambda.function_name
principal = var.principal
source_arn = aws_s3_bucket.Test_Bucket.arn
}
