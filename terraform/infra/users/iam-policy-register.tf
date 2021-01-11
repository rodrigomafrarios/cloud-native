resource "aws_iam_policy" "register_policy" {
  name = "${var.env}-register-policy"
  policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
    "Action": [
        "dynamodb:putItem"
    ],
    "Effect": "Allow",
    "Resource": "${aws_dynamodb_table.users.arn}"
    },
    {
        "Effect": "Allow",
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource": "*"
    }
]
}
EOF
}