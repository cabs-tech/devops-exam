resource "gitea_repository" "repo" {
  username     = var.gitea_repo_username
  name         = var.gitea_repo_name
  private      = var.gitea_repo_private
  issue_labels = var.gitea_repo_issue_labels
  license      = var.gitea_repo_license
  gitignores   = var.gitea_repo_gitignores
}

resource "gitea_repository_branch_protection" "main" {
  name                                    = gitea_repository.repo.name
  username                                = gitea_repository.repo.username

  rule_name                               = var.gitea_repo_branch
  enable_push                             = var.gitea_repo_enable_push
  block_merge_on_official_review_requests = var.gitea_repo_block_merge_on_official_review_requests
  block_merge_on_outdated_branch          = var.gitea_repo_block_merge_on_outdated_branchh
  block_merge_on_rejected_reviews         = var.gitea_repo_block_merge_on_rejected_reviews
}

module "docker_app" {
  source                     = "./modules/docker-app"
  
  network_name               = var.docker_app_network_name
  volume_name                = var.docker_app_volume_name
  app_container_name         = var.docker_app_container_name
  app_image_name             = var.docker_app_image_name
  app_image_version          = var.docker_app_image_version
  app_container_ports= {
    internal = var.docker_app_container_port_internal
    external = var.docker_app_container_port_external
  }
  app_volume_container_path              = var.docker_app_volume_container_path
  app_container_healthcheck_command      = var.docker_app_container_healthcheck_command
  app_container_healthcheck_interval     = var.docker_app_container_healthcheck_interval
  app_container_healthcheck_timeout      = var.docker_app_container_healthcheck_timeout
  app_container_healthcheck_retries      = var.docker_app_container_healthcheck_retries
  app_container_healthcheck_start_period = var.docker_app_container_healthcheck_start_period
  healthcheck_container_name             = var.docker_app_healthcheck_container_name
  healthcheck_image_name                 = var.docker_app_healthcheck_image_name
  healthcheck_image_version              = var.docker_app_healthcheck_image_version
  healthcheck_container_command          = var.docker_app_healthcheck_container_command
  container_labels                       = var.docker_app_container_labels
}