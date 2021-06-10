resource "cloudflare_record" "dflmn_ses_mx" {
  zone_id  = module.dfl_mn.zone_id
  name     = "ses"
  type     = "MX"
  value    = "inbound-smtp.eu-west-1.amazonaws.com"
  priority = 10
}

resource "cloudflare_record" "dflmn_ses_txt" {
  zone_id = module.dfl_mn.zone_id
  name    = "_amazonses.ses"
  type    = "TXT"
  value   = "VEJgs8FdY5WGi/Sg8EjPUlR+r5wbJvN4vyXZiab1zjQ="
}

resource "cloudflare_record" "dflmn_ses_domainkey_1" {
  zone_id = module.dfl_mn.zone_id
  name    = "jmv3ey5brt6wp64aquv7e6pmgj3m2zfi._domainkey.ses"
  type    = "CNAME"
  value   = "jmv3ey5brt6wp64aquv7e6pmgj3m2zfi.dkim.amazonses.com"
}

resource "cloudflare_record" "dflmn_ses_domainkey_2" {
  zone_id = module.dfl_mn.zone_id
  name    = "oapkcsxs37goqvx4jydjubagqml6544f._domainkey.ses"
  type    = "CNAME"
  value   = "oapkcsxs37goqvx4jydjubagqml6544f.dkim.amazonses.com"
}

resource "cloudflare_record" "dflmn_ses_domainkey_3" {
  zone_id = module.dfl_mn.zone_id
  name    = "ysimhqy4t3riv543ehlzcjlarf7nkvrf._domainkey.ses"
  type    = "CNAME"
  value   = "ysimhqy4t3riv543ehlzcjlarf7nkvrf.dkim.amazonses.com"
}
