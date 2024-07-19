variable bucket_name{
    type = string
    default = "my-test-bucket0445"
}

variable S3_acl{
    type = string
    default = "private"
}

variable filter_prefix{
    type = string
    default = "file-prefix"
}

variable filter_suffix{
    type = string
    default = "file-extension"
}

variable events{
    type = list(string)
    default = ["s3:ObjectCreated:*"]
}

variable email{
    type = string
    default = "menedipavankumar@gmail.com"
}

variable email2{
    type = string
    default = "menedipavankumar0445@gmail.com"
}

variable function_name{
    type = string
    default = "Email_Notification_Task"
}

variable handler{
    type = string
    default = "lambda_function.lambda_handler"
}

variable runtime{
    type = string
    default = "python3.12"
}

variable statement_id{
    type = string
    default = "AllowS3Invoke"
}

variable action{
    type = string
    default = "lambda:InvokeFunction"
}

variable principal{
    type = string
    default = "s3.amazonaws.com"
}

variable role_name{
    type = string
    default = "test_role"
}

variable policy_name{
    type = string
    default = "FullAccessPolicy"
}

variable description{
    type = string
    default = "A policy that grants full access to S3, Amazon SES, and CloudWatch"
}

variable "assume_role_policy" {
  description = "The IAM assume role policy document"
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Sid": "",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}
EOF
}

variable "policy" {
  description = "The IAM policy document"
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "ses:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "cloudwatch:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

variable SENDER_EMAIL{
    type = string
    default = "menedipavankumar@gmail.com"
}

variable RECIPIENT_EMAIL{
    type = string
    default = "menedipavankumar0445@gmail.com"
}
