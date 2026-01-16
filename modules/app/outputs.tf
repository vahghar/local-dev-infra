output "host" {
  value       = docker_container.node.name
  description = "Application hostname inside the Docker network"
}

output "port" {
  value       = 3000
  description = "Application internal port"
}
