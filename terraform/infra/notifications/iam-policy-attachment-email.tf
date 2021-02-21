resource "aws_iam_policy_attachment" "email-policy-attachment" {
  name       = "${var.env}-email-attachment"
  roles      = ["${aws_iam_role.email_iam_role.name}"]
  policy_arn = "${aws_iam_policy.email_policy.arn}"
}