resource "aws_sqs_queue" "sms" {
  name = "${var.env}-sms-queue"
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sms_dlq.arn
    maxReceiveCount     = 3
  })
  policy = templatefile("${path.module}/templates/sqs-sns-policy.tpl",
  {
      resource = "arn:aws:sqs:${var.region}:${var.account_id}:${var.env}-sms-queue",
      source_arn = "${aws_sns_topic.notifications.arn}"
  })
}

resource "aws_ssm_parameter" "sms-sqs" {
  name = "${var.env}-sms-sqs"
  type = "String"
  value = "${aws_sqs_queue.sms.arn}"
}

resource "aws_sqs_queue" "sms_dlq" {
  name = "${var.env}-sms-queue-dlq"
}