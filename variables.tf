variable "gitea_url" {
  description = "Gitea URL"
  type        = string
  default     = "http://localhost:3000/"
}

variable "gitea_token" {
  description = "Gitea Token"
  type        = string
  default     = "d016ebad011f06965175d912983b11a8cd29c1f1"
}

variable "gitea_repo_username" {
  description = "Gitea Repository Username"
  type        = string
  default     = "casarmiento"
}

variable "gitea_repo_name" {
  description = "Gitea Repository Name"
  type        = string
  default     = "terraform-docker-exam"
}

variable "gitea_repo_private" {
  description = "Sets the Gitea Repository to private"
  type        = bool
  default     = true
}

variable "gitea_repo_enable_push" {
  description = "Enable push to users with write access and prevent force push"
  type        = bool
  default     = true
}

variable "gitea_repo_block_merge_on_official_review_requests" {
  description = "Block merge when the repo has official review requests, even if there are enough approvals."
  type        = bool
  default     = true
}

variable "gitea_repo_block_merge_on_outdated_branchh" {
  description = "Block merge when head branch is behind base branch"
  type        = bool
  default     = true
}

variable "gitea_repo_block_merge_on_rejected_reviews" {
  description = "Block merge when changes are requested by official reviewers, even if there are enough approvals"
  type        = bool
  default     = true
}

variable "gitea_repo_issue_labels" {
  description = "Sets the Gitea repository issue labels"
  type        = string
  default     = "Default"
}

variable "gitea_repo_license" {
  description = "Sets the Gitea repository license"
  type        = string
  default     = "MIT"
}

variable "gitea_repo_gitignores" {
  description = "Sets the Gitea repository gitignores"
  type        = string
  default     = "Go"
}

variable "gitea_repo_branch" {
  description = "Gitea repository protected branch name"
  type        = string
  default     = "main"
}

variable "docker_app_network_name" {
  description = "Network name of the docker app"
  type        = string
  default     = "exam-network"
}

variable "docker_app_volume_name" {
  description = "Network name of the docker app"
  type        = string
  default     = "exam-web-data"
}

variable "docker_app_container_name" {
  description = "Container name of the docker app"
  type        = string
  default     = "exam-web-server"
}

variable "docker_app_image_name" {
  description = "Image name of the docker app"
  type        = string
  default     = "nginx"
}

variable "docker_app_image_version" {
  description = "Image version of the docker app"
  type        = string
  default     = "1.27.4"
}

variable "docker_app_container_port_internal" {
  description = "Internal container port of the docker app"
  type        = number
  default     = 80
}

variable "docker_app_container_port_external" {
  description = "External container port of the docker app"
  type        = number
  default     = 8081
}

variable "docker_app_volume_container_path" {
  description = "Container path of the docker app volume"
  type        = string
  default     = "/var/cache/nginx"
}

variable "docker_app_container_healthcheck_command" {
  description = "The command to run in the container for healthcheck"
  type        = list(string)
  default     = [
    "CMD",
    "curl",
    "-f", "http://localhost/"
  ]
}

variable "docker_app_container_healthcheck_interval" {
  description = "The interval for the healthcheck in seconds"
  type        = string
  default     = "30s"
}

variable "docker_app_container_healthcheck_timeout" {
  description = "The timeout for the healthcheck in seconds"
  type        = string
  default     = "10s"
}

variable "docker_app_container_healthcheck_retries" {
  description = "The number of retries for the healthcheck"
  type        = number
  default     = 3
}

variable "docker_app_container_healthcheck_start_period" {
  description = "The start period for the healthcheck in seconds"
  type        = string
  default     = "10s"
}

variable "docker_app_healthcheck_container_name" {
  description = "Container name of the docker app healthchecker"
  type        = string
  default     = "exam-health-checker"
}

variable "docker_app_healthcheck_image_name" {
  description = "Image name of the docker app healthcheck container"
  type        = string
  default     = "curlimages/curl"
}

variable "docker_app_healthcheck_image_version" {
  description = "Image version of the docker app healthcheck container"
  type        = string
  default     = "8.17.0"
}

variable "docker_app_healthcheck_container_command" {
  description = "The command to run in the healthcheck container to check the app health"
  type        = list(string)
  default     = [
    "sh", 
    "-c", 
    "while true; do curl -sf http://exam-web-server:80 || echo 'Health check failed'; sleep 30; done"
  ]
}

variable "docker_app_container_labels" {
  description = "A map of labels to apply to the Docker container"
  type        = map(string)
  default = {
    "project"     = "devops-exam"
    "managed-by"  = "terraform"
    "environment" = "development"
  }
}