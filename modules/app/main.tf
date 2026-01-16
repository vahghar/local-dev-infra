resource "docker_image" "node" {
  name         = "node:20"
}

resource "docker_container" "node" {
  name  = var.container_name
  image = docker_image.node.image_id

  env = [
    "PORT=3000",

    "DB_HOST=${var.db_host}",
    "DB_PORT=${var.db_port}",
    "DB_NAME=${var.db_name}",
    "DB_USER=${var.db_user}",
    "DB_PASSWORD=${var.db_password}",

    "REDIS_HOST=${var.redis_host}",
    "REDIS_PORT=${var.redis_port}"
  ]

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 3000
    external = 3000
  }

  restart = "unless-stopped"
}
