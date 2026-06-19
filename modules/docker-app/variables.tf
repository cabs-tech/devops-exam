variable "network_name" {
  description = "The name of the exam network"
  type        = string
}

variable "volume_name" {
  description = "The name of the exam volume"
  type        = string
}

variable "app_container_name" {
  description = "The name of the exam web app container"
  type        = string
}

variable "app_image_name" {
  description = "The name of the exam web app container image"
  type        = string
}

variable "app_image_version" {
  description = "The version of the exam web app container image"
  type        = string
}

variable "app_container_ports" {
  description = "The container ports of the exam web app"
  type = object({
    internal = number
    external = number
  })

  validation {
    condition     = var.app_container_ports.internal >= 1 && var.app_container_ports.internal <= 65535
    error_message = "The internal port must be a valid port number between 1 and 65535."
  }

  validation {
    condition     = var.app_container_ports.external >= 1024 && var.app_container_ports.external <= 65535
    error_message = "The external port must be a valid port number between 1024 and 65535."
  }
}

variable "app_volume_container_path" {
  description = "The container path of the app volume"
  type        = string
}

variable "app_container_healthcheck_command" {
  description = "The command to run in the container for healthcheck"
  type        = list(string)
}

variable "app_container_healthcheck_interval" {
  description = "The interval for the healthcheck in seconds"
  type        = string
}

variable "app_container_healthcheck_timeout" {
  description = "The timeout for the healthcheck in seconds"
  type        = string
}

variable "app_container_healthcheck_retries" {
  description = "The number of retries for the healthcheck"
  type        = number
}

variable "app_container_healthcheck_start_period" {
  description = "The start period for the healthcheck in seconds"
  type        = string
}

variable "healthcheck_container_name" {
  description = "The name of the exam web app healthcheck container"
  type        = string
}

variable "healthcheck_image_name" {
  description = "The name of the exam web app healthcheck container image"
  type        = string
}

variable "healthcheck_image_version" {
  description = "The version of the exam web app healthcheck container image"
  type        = string
}

variable "healthcheck_container_command" {
  description = "The command to run in the healthcheck container to check the app health"
  type        = list(string)
}

variable "container_labels" {
  description = "A map of labels to apply to the Docker container"
  type        = map(string)
}