terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "4.5.0"
    }
  }
}

resource "docker_network" "exam_network" {
  name = var.network_name
}

resource "docker_volume" "exam_volume" {
  name = var.volume_name
}

resource "docker_image" "nginx" {
  name = "${var.app_image_name}:${var.app_image_version}"
}

resource "docker_container" "nginx" {
  name  = var.app_container_name
  image = docker_image.nginx.image_id

  ports {
    internal = var.app_container_ports.internal
    external = var.app_container_ports.external
  }

  networks_advanced {
    name = docker_network.exam_network.name
  }

  volumes {
    volume_name    = docker_volume.exam_volume.name
    container_path = var.app_volume_container_path
  }

  healthcheck {
    test         = var.app_container_healthcheck_command
    interval     = var.app_container_healthcheck_interval
    timeout      = var.app_container_healthcheck_timeout
    retries      = var.app_container_healthcheck_retries
    start_period = var.app_container_healthcheck_start_period
  }

  dynamic "labels" {
    for_each = var.container_labels
    content {
      label = labels.key
      value = labels.value
    }
  }
}

resource "docker_image" "curl" {
  name = "${var.healthcheck_image_name}:${var.healthcheck_image_version}"
}

resource "docker_container" "health-check" {
  name  = var.healthcheck_container_name
  image = docker_image.curl.image_id

  networks_advanced {
    name = docker_network.exam_network.name
  }

  command = var.healthcheck_container_command

  depends_on = [ docker_container.nginx ]

  dynamic "labels" {
    for_each = var.container_labels
    content {
      label = labels.key
      value = labels.value
    }
  }
}