output "nginx_container_id" {
  value       = docker_container.nginx.id
  description = "Nginx container id"
}

output "healthcheck_container_id" {
  value       = docker_container.health-check.id
  description = "Health check container id"
}

output "network_id" {
  value       = docker_network.exam_network.id
  description = "Health check container id"
}