module "base_domain" {
  source = "../domain"

  domain         = var.domain
  has_domain_key = false
  email          = false
  keybase        = false
}

resource "cloudflare_record" "root" {
  zone_id = module.base_domain.zone_id
  name    = module.base_domain.domain
  type    = "A"
  value   = "1.2.3.4"
  proxied = true
}

resource "cloudflare_page_rule" "this" {
  zone_id  = module.base_domain.zone_id
  target   = "*${module.base_domain.domain}/*"
  priority = 2

  actions {
    forwarding_url {
      url         = var.redirect_to
      status_code = 301
    }
  }
}
