output "host" {
  value       = docker_container.postgres.name
  description = "Hostname to connect to Postgres"
}

output "port" {
  value       = 5432
  description = "Postgres port"
}

output "db_name" {
  value = var.db_name
}

output "db_user" {
  value = var.db_user
}
