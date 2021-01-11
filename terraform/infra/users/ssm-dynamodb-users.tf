resource "aws_ssm_parameter" "dynamodb-users-table" {
  name = "${var.env}-dynamodb-users-table"
  type = "String"
  value = "${aws_dynamodb_table.users.name}"
}
