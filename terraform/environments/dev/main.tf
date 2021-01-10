module "dynamodb" {
  source = "../../infra/dynamodb"
  env = "${var.env}"
  write_capacity = 1
  read_capacity = 1
}