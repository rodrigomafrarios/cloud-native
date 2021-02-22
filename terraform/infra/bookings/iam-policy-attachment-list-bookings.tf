resource "aws_iam_policy_attachment" "list-bookings-policy-attachment" {
  name       = "${var.env}-list-bookings-attachment"
  roles      = ["${aws_iam_role.list_bookings_iam_role.name}"]
  policy_arn = "${aws_iam_policy.list_bookings_policy.arn}"
}