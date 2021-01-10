module "dynamodb" {
  source = "../../infra/dynamodb"
  env = "${var.env}"
  write_capacity = 10
  read_capacity = 10
}