module "users" {
  source = "../../infra/users"
  env = "${var.env}"
  write_capacity = 1
  read_capacity = 1
}