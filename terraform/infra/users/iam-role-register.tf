resource "aws_iam_role" "register_iam_role" {
  name = "${var.env}-register-iam-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_ssm_parameter" "register_iam_role" {
  name = "${var.env}-register-iam-role"
  type = "String"
  value = "${aws_iam_role.register_iam_role.arn}"
}
