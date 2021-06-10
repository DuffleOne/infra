terraform {
  backend "remote" {
    organization = "dfl"

    workspaces {
      name = "cuv-do-prod"
    }
  }
}

variable "cuv_do_token" {}

provider "digitalocean" {
  token = var.cuv_do_token
}
