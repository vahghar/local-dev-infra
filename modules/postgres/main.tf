resource "docker_image" "postgres" {
  name         = "postgres:15"
  keep_locally = false
}

resource "docker_volume" "postgres_data" {
  name = "${var.container_name}-data"
}

resource "docker_container" "postgres" {
  name  = var.container_name
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_DB=${var.db_name}",
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}"
  ]

  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 5432
    external = 5432
  }

  restart = "unless-stopped"
}
