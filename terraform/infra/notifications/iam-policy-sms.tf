resource "aws_iam_policy" "sms_policy" {
  name = "${var.env}-sms-policy"
  policy = templatefile("${path.module}/templates/lambda-sqs-policy.tpl", {
        action = join("\",\"", [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]),
        resource = "${aws_sqs_queue.sms.arn}"
    })
}
