resource "aws_iam_role" "iam_for_lambda" {
  name = var.role_name

  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_policy" "full_access_policy" {
  name        = var.policy_name
  description = var.description
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "full_access_policy_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.full_access_policy.arn
}
