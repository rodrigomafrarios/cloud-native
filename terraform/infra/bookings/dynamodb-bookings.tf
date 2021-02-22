resource "aws_dynamodb_table" "bookings" {
  name = "${var.env}-bookings"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  write_capacity = "${var.write_capacity}"
  read_capacity = "${var.read_capacity}"
  stream_enabled = true
  stream_view_type = "NEW_IMAGE"
}
