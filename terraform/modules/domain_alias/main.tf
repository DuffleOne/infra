module "base_domain" {
  source = "../domain"

  domain               = var.domain
  domain_key           = var.domain_key
  email                = var.email
  keybase_verification = var.keybase_verification
}

resource "cloudflare_record" "root" {
  zone_id = module.base_domain.zone_id
  name    = module.base_domain.domain
  type    = "A"
  value   = "1.2.3.4"
  proxied = true
}

resource "cloudflare_page_rule" "redirect_home" {
  zone_id  = module.base_domain.zone_id
  target   = "*${module.base_domain.domain}/*"
  priority = 2

  actions {
    forwarding_url {
      url         = "https://duffle.one/$2"
      status_code = 301
    }
  }
}
