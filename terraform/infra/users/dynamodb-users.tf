resource "aws_dynamodb_table" "users" {
  name = "${var.env}-users"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  write_capacity = "${var.write_capacity}"
  read_capacity = "${var.read_capacity}"

  attribute {
    name = "email"
    type = "S"
  }

  global_secondary_index {
    name = "${var.env}-email-gsi"
    projection_type = "ALL"
    hash_key = "email"
    write_capacity = "${var.write_capacity}"
    read_capacity = "${var.read_capacity}"
  }
}
resource "aws_dynamodb_table_item" "admin" {
  table_name = "${aws_dynamodb_table.users.name}"
  hash_key = "${aws_dynamodb_table.users.hash_key}"
  
      item = <<ITEM
  {
    "id": {"S": "${var.admin_id}"},
    "email": {"S": "${var.admin_email}"},
    "role": {"S": "admin"},
    "password": {"S": "${var.admin_password}"},
    "name": {"S": "${var.admin_name}"}
  }
  ITEM
}