resource "aws_ses_email_identity" "email_identity" {
  email = var.email
}

resource "aws_ses_email_identity" "email_identity2" {
  email = var.email2
}
