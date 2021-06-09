terraform {
  backend "remote" {
    organization = "dfl"

    workspaces {
      name = "dfl-prod"
    }
  }
}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.9.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}
