terraform {
  backend "remote" {
    organization = "dfl"

    workspaces {
      name = "cuv-do-prod"
    }
  }
}

provider "digitalocean" {
  token = var.cuv_do_token
}
