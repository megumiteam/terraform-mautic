resource "aws_ses_domain_identity" "domain" {
  provider = "aws.oregon"
  domain = "${var.email}"
}

resource "aws_ses_receipt_rule_set" "ses" {
  provider = "aws.oregon"
  rule_set_name = "ruleset-${var.email}"
}

resource "aws_ses_active_receipt_rule_set" "ses" {
  provider = "aws.oregon"
  rule_set_name = "${aws_ses_receipt_rule_set.ses.rule_set_name}"
}

resource "aws_ses_receipt_rule" "receive" {
  provider = "aws.oregon"
  name          = "receive-${var.email}"
  rule_set_name = "${aws_ses_receipt_rule_set.ses.rule_set_name}"
  recipients    = ["${var.email}"]
  enabled       = true
  scan_enabled  = true
}
