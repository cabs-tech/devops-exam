output "clone_url" {
  value       = gitea_repository.repo.clone_url
  description = "Repo Clone URL"
}

output "web_url" {
  value       = gitea_repository.repo.html_url
  description = "Repo Web URL"
}

output "nginx_container_id" {
  value       = module.docker_app.nginx_container_id
  description = "Nginx container id"
}

output "healthcheck_container_id" {
  value       = module.docker_app.healthcheck_container_id
  description = "Healthcheck container id"
}

output "network_id" {
  value       = module.docker_app.network_id
  description = "Docker app network id"
}