resource "aws_iam_access_key" "ses" {
  user    = "${aws_iam_user.ses.name}"
}

resource "aws_iam_user" "ses" {
  name = "Mautic-${var.site_name}"
}

resource "aws_iam_user_policy" "ses_ro" {
  name = "Mautic-${var.site_name}"
  user = "${aws_iam_user.ses.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ses:SendRawEmail",
            "Resource": "*"
        }
    ]
}
EOF
}

output "secret" {
  value = "${aws_iam_access_key.ses.encrypted_secret}"
}
output "user" {
  value = "${aws_iam_access_key.ses.user}"
}
