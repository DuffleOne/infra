terraform {
  backend "remote" {
    organization = "dfl"

    workspaces {
      name = "dfl-prod"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

data "terraform_remote_state" "cuv_do_prod" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "dfl"

    workspaces = {
      name = "cuv-do-prod"
    }
  }
}
