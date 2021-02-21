data "aws_caller_identity" "current" {}

module "users" {
  source = "../../infra/users"
  env = "${var.env}"
  write_capacity = 10
  read_capacity = 10
  jwt_secret = "${var.jwt_secret}"
  admin_id = "${var.admin_id}"
  admin_email = "${var.admin_email}"
  admin_password = "${var.admin_password}"
  admin_name = "${var.admin_name}"
}
module "bookings" {
  source = "../../infra/bookings"
  env = "${var.env}"
  write_capacity = 10
  read_capacity = 10
  jwt_secret = "${var.jwt_secret}"
  sns_notifications_arn = "${module.notifications.notifications_topic_arn}"
}

module "notifications" {
  source = "../../infra/notifications"
  env = "${var.env}"
  account_id = "${data.aws_caller_identity.current.account_id}"
  region = "${var.region}"
}

module "system" {
  source = "../../infra/system"
  env = "${var.env}"
  email_from = "${var.email_from}"
  email_from_password = "${var.email_from_password}"
  email_to = "${var.email_to}"
  smtp_server = "${var.smtp_server}"
  sms_phone_from = "${var.sms_phone_from}"
  sms_phone_to = "${var.sms_phone_to}"
  message_bird_api_key = "${var.message_bird_api_key}"
}