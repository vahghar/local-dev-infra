resource "docker_image" "redis" {
  name         = "redis:7"
  keep_locally = false
}

resource "docker_container" "localredis" {
  name  = var.container_name
  image = docker_image.redis.image_id

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 6379
    external = 6379
  }

  restart = "unless-stopped"
}