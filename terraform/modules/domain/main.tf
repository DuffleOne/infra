resource "cloudflare_zone" "this" {
  zone = var.domain
  plan = "free"
  type = "full"
}

resource "cloudflare_record" "mx_1" {
  count    = var.email ? 1 : 0
  zone_id  = cloudflare_zone.this.id
  name     = cloudflare_zone.this.zone
  type     = "MX"
  value    = "aspmx.l.google.com"
  priority = 1
}

resource "cloudflare_record" "mx_2" {
  count    = var.email ? 1 : 0
  zone_id  = cloudflare_zone.this.id
  name     = cloudflare_zone.this.zone
  type     = "MX"
  value    = "alt1.aspmx.l.google.com"
  priority = 5
}

resource "cloudflare_record" "mx_3" {
  count    = var.email ? 1 : 0
  zone_id  = cloudflare_zone.this.id
  name     = cloudflare_zone.this.zone
  type     = "MX"
  value    = "alt2.aspmx.l.google.com"
  priority = 5
}

resource "cloudflare_record" "mx_4" {
  count    = var.email ? 1 : 0
  zone_id  = cloudflare_zone.this.id
  name     = cloudflare_zone.this.zone
  type     = "MX"
  value    = "alt3.aspmx.l.google.com"
  priority = 10
}

resource "cloudflare_record" "mx_5" {
  count    = var.email ? 1 : 0
  zone_id  = cloudflare_zone.this.id
  name     = cloudflare_zone.this.zone
  type     = "MX"
  value    = "alt4.aspmx.l.google.com"
  priority = 10
}

resource "cloudflare_record" "spf" {
  count   = var.email ? 1 : 0
  zone_id = cloudflare_zone.this.id
  name    = cloudflare_zone.this.zone
  type    = "TXT"
  value   = "v=spf1 include:_spf.google.com ~all"
}

resource "cloudflare_record" "key" {
  count   = var.has_domain_key ? 1 : 0
  zone_id = cloudflare_zone.this.id
  name    = "google._domainkey"
  type    = "TXT"
  value   = "v=DKIM1; k=rsa; p=${var.domain_key}"
}

resource "cloudflare_record" "keybase" {
  count   = var.keybase ? 1 : 0
  zone_id = cloudflare_zone.this.id
  name    = cloudflare_zone.this.zone
  type    = "TXT"
  value   = "keybase-site-verification=${var.keybase_verification}"
}
