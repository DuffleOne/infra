terraform {
  backend "remote" {
    organization = "dfl"

    workspaces {
      name = "dfl-prod"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

variable "cloudflare_email" {}
variable "cloudflare_api_key" {}

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
