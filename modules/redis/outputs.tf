output "host" {
  value       = docker_container.localredis.name
  description = "Redis hostname"
}

output "port" {
  value       = 6379
  description = "Redis port"
}
