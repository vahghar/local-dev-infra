resource "docker_network" "dev_network" {
  name = "local-dev-network"
}

module "database_module" {
  source         = "./modules/postgres"
  db_name        = var.db_name
  db_user        = var.db_user
  db_password    = var.db_password
  network_name   = docker_network.dev_network.name
  project_name   = var.project_name
  container_name = "${var.project_name}-postgres"
}

module "redis_module" {
  source         = "./modules/redis"
  container_name = "${var.project_name}-redis"
  network_name   = docker_network.dev_network.name
  project_name   = var.project_name
}

module "app_module" {
  source         = "./modules/app"
  network_name   = docker_network.dev_network.name
  db_host        = module.database_module.host
  db_port        = module.database_module.port
  db_name        = var.db_name
  db_user        = var.db_user
  db_password    = var.db_password
  redis_host     = module.redis_module.host
  redis_port     = module.redis_module.port
  project_name   = var.project_name
  container_name = "${var.project_name}-bluegatorade"
}
