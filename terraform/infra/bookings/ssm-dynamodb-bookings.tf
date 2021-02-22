resource "aws_ssm_parameter" "dynamodb-bookings-table" {
  name = "${var.env}-dynamodb-bookings-table"
  type = "String"
  value = "${aws_dynamodb_table.bookings.name}"
}

resource "aws_ssm_parameter" "dynamodb-bookings-stream" {
  name = "${var.env}-dynamodb-bookings-stream"
  type = "String"
  value = "${aws_dynamodb_table.bookings.stream_arn}"
}