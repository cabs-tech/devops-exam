terraform {
  required_providers {
    gitea = {
      source = "go-gitea/gitea"
      version = "0.6.0"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "4.5.0"
    }
  }
}

provider "gitea" {
  base_url = var.gitea_url
  token    = var.gitea_token
}

provider "docker" {
}