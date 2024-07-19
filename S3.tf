resource "aws_s3_bucket" "Test_Bucket" {
bucket = var.bucket_name
acl    = var.S3_acl
}


resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
bucket = aws_s3_bucket.Test_Bucket.id
lambda_function {
lambda_function_arn = aws_lambda_function.my_lambda.arn
events              = var.events
filter_prefix       = var.filter_prefix
filter_suffix       = var.filter_suffix
}
}
