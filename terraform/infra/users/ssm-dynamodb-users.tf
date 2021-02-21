resource "aws_ssm_parameter" "dynamodb-users-table" {
  name = "${var.env}-dynamodb-users-table"
  type = "String"
  value = "${aws_dynamodb_table.users.name}"
}
resource "aws_ssm_parameter" "email-gsi" {
  name = "${var.env}-email-gsi"
  type = "String"
  value = "${var.env}-email-gsi"
}