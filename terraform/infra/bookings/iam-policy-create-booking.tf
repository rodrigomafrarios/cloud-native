resource "aws_iam_policy" "create_booking_policy" {
  name = "${var.env}-create-booking-policy"
  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
        action = "dynamodb:putItem",
        resource = "${aws_dynamodb_table.bookings.arn}",
        sns_topic = ""
    })
}
