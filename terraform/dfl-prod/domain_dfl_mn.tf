module "dfl_mn" {
  source = "../modules/domain"

  domain     = "dfl.mn"
  domain_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPMzaX0DMLvdwFg5j6ifkunYhkn0JvMKghrlzR5r6BelB9cVV3w72ncqsOiMHGNh8pL98n6x9iz5Q4fmU9aTXUoyx4xQmuuR/3armuIKEr88uox4ArZy4TWR8OuDKuMlezt4WwCOUdyqxnqUgpd6gOZL20TY81PB8Zd3EG93Yv8QIDAQAB"

  keybase              = true
  keybase_verification = "5iWvlQacJDPK1-1tMxiRwdUeNv7eFEdIDqyJT2xqSLY"
}

resource "cloudflare_record" "dflmn_root" {
  zone_id = module.dfl_mn.zone_id
  name    = module.dfl_mn.domain
  type    = "CNAME"
  value   = "doproxy.k.dfl.mn"
}
