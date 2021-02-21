resource "aws_iam_policy" "register_policy" {
  name = "${var.env}-register-policy"
  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
        action = "dynamodb:putItem",
        resource = "${aws_dynamodb_table.users.arn}"
    })
}
