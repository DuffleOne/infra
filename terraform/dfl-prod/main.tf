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
