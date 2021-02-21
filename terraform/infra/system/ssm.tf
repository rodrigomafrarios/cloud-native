resource "aws_ssm_parameter" "email_from" {
  name = "${var.env}-email-from"
  type = "String"
  value = "${var.email_from}"
}

resource "aws_ssm_parameter" "email_from_password" {
  name = "${var.env}-email-from-password"
  type = "String"
  value = "${var.email_from_password}"
}

resource "aws_ssm_parameter" "email_to" {
  name = "${var.env}-email-to"
  type = "String"
  value = "${var.email_to}"
}

resource "aws_ssm_parameter" "smtp_server" {
  name = "${var.env}-smtp-server"
  type = "String"
  value = "${var.smtp_server}"
}

resource "aws_ssm_parameter" "message_bird_api_key" {
  name = "${var.env}-message-bird-api-key"
  type = "String"
  value = "${var.message_bird_api_key}"
}

resource "aws_ssm_parameter" "sms_phone_from" {
  name = "${var.env}-sms-phone-from"
  type = "String"
  value = "${var.sms_phone_from}"
}

resource "aws_ssm_parameter" "sms_phone_to" {
  name = "${var.env}-sms-phone-to"
  type = "String"
  value = "${var.sms_phone_to}"
}
